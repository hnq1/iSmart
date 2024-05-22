using iSmart.Service;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;
using iSmart.Entity.Models;

internal class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();

        // JWT
        builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.RequireHttpsMetadata = false;
                options.SaveToken = true;
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuer = true,
                    ValidateLifetime = true,
                    ValidateAudience = true,
                    ValidAudience = builder.Configuration["Jwt:Audience"],
                    ValidIssuer = builder.Configuration["Jwt:Issuer"],
                    ClockSkew = TimeSpan.Zero,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
                };
            });

        builder.Services.AddSwaggerGen(option =>
        {
            option.SwaggerDoc("v1", new OpenApiInfo { Title = "Project API", Version = "v1" });
            option.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
            {
                In = ParameterLocation.Header,
                Description = "Please enter a valid token",
                Name = "Authorization",
                Type = SecuritySchemeType.Http,
                BearerFormat = "JWT",
                Scheme = "Bearer"
            });
            option.AddSecurityRequirement(new OpenApiSecurityRequirement
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                        }
                    },
                    new string[]{ }
                }
            });
        });

        builder.Services.AddControllers();
        builder.Services.AddCors(options =>
        {
            options.AddPolicy("AllowAll", builder =>
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader());
        });

        // Đăng ký DbContext với DI container
        builder.Services.AddDbContext<iSmartContext>(options =>
            options.UseSqlServer(builder.Configuration.GetConnectionString("SqlConnection")));

        // Đăng ký các dịch vụ
        builder.Services.AddScoped<ICategoryService, CategoryService>();
        // builder.Services.AddScoped<IStorageService, StorageService>();
        // builder.Services.AddScoped<IGoodsService, GoodsService>();
        // builder.Services.AddScoped<ISupplierService, SupplierService>();
        // builder.Services.AddScoped<IUserService, UserService>();
        // builder.Services.AddScoped<IStatusService, StatusService>();
        // builder.Services.AddScoped<IImportOrderService, ImportOrderService>();
        // builder.Services.AddScoped<IImportOrderDetailService, ImportOrderDetailService>();
        // builder.Services.AddScoped<IExportOrderService, ExportOrderService>();
        // builder.Services.AddScoped<IExportOrderDetailService, ExportOrderDetailService>();
        // builder.Services.AddScoped<IProjectService, ProjectService>();
        // builder.Services.AddScoped<IDeliveryService, DeliveryService>();
        // builder.Services.AddScoped<IStocktakeNoteService, StocktakeNoteService>();
        // builder.Services.AddScoped<IStocktakeNoteDetailService, StocktakeNoteDetailService>();

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI(option => option.RoutePrefix = string.Empty);
            app.UseSwaggerUI(option => option.SwaggerEndpoint("../swagger/v1/swagger.json", "Project API v1"));
        }

        app.UseHttpsRedirection();
        app.UseAuthentication();
        app.UseAuthorization();

        app.MapControllers();

        app.UseCors("AllowAll");

        app.Run();
    }
}
