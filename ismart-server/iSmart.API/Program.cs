using iSmart.Entity.Models;
using iSmart.Service;
using Microsoft.AspNetCore.Authentication.JwtBearer;

//using iSmart.Service;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

internal class Program
{
    private static void Main(string[] args)
    //{
    //    var builder = WebApplication.CreateBuilder(args);

    //    // Add services to the container
    //    ConfigureServices(builder);

    //    var app = builder.Build();

    //    // Configure the HTTP request pipeline
    //    ConfigureMiddleware(app);

    //    app.Run();
    //}

    //private static void ConfigureServices(WebApplicationBuilder builder)
    //{
    //    builder.Services.AddEndpointsApiExplorer();

    //    //Configure JWT
    //    builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    //        .AddJwtBearer(options =>
    //        {
    //            options.RequireHttpsMetadata = false;
    //            options.SaveToken = true;
    //            options.TokenValidationParameters = new TokenValidationParameters()
    //            {
    //                ValidateIssuer = true,
    //                ValidateLifetime = true,
    //                ValidateAudience = true,
    //                ValidAudience = builder.Configuration["Jwt:Audience"],
    //                ValidIssuer = builder.Configuration["Jwt:Issuer"],
    //                ClockSkew = TimeSpan.Zero,
    //                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    //            };
    //        });

    //    builder.Services.AddSwaggerGen(option =>
    //    {
    //        option.SwaggerDoc("v1", new OpenApiInfo { Title = "iSmart API", Version = "v1" });
    //        option.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    //        {
    //            In = ParameterLocation.Header,
    //            Description = "Please enter a valid token",
    //            Name = "Authorization",
    //            Type = SecuritySchemeType.Http,
    //            BearerFormat = "JWT",
    //            Scheme = "Bearer"
    //        });
    //        option.AddSecurityRequirement(new OpenApiSecurityRequirement
    //        {
    //            {
    //                new OpenApiSecurityScheme
    //                {
    //                    Reference = new OpenApiReference
    //                    {
    //                        Type = ReferenceType.SecurityScheme,
    //                        Id = "Bearer"
    //                    }
    //                },
    //                new string[] { }
    //            }
    //        });



    //        builder.Services.AddControllers();
    //        builder.Services.AddCors(options =>
    //        {
    //            options.AddPolicy("AllowAll", builder =>
    //                builder.AllowAnyOrigin()
    //                       .AllowAnyMethod()
    //                       .AllowAnyHeader());
    //        });

    //        builder.Services.AddDbContext<iSmartContext>(options =>
    //            options.UseSqlServer(builder.Configuration.GetConnectionString("SqlConnection")));

    //        // Register other services here
    //        // builder.Services.AddScoped<ICategoryService, CategoryService>();

    //    });
    //}

    //private static void ConfigureMiddleware(WebApplication app)
    //{
    //    if (app.Environment.IsDevelopment())
    //    {
    //        app.UseSwagger();
    //        app.UseSwaggerUI(option => option.SwaggerEndpoint("/swagger/v1/swagger.json", "iSmart API v1"));
    //    }

    //    app.UseHttpsRedirection();
    //    app.UseAuthentication();
    //    app.UseAuthorization();

    //    app.MapControllers();

    //    app.UseCors("AllowAll");
    //}
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();

        //JWt
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
            option.SwaggerDoc("v1", new OpenApiInfo { Title = "iSmart API", Version = "v1" });
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
                            Type=ReferenceType.SecurityScheme,
                            Id="Bearer"
                        }
                    },
                    new string[]{}
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
        /*builder.Services.AddAutoMapper(typeof(Program).Assembly);*/
        builder.Services.AddDbContext<iSmartContext>(options =>
                    options.UseSqlServer(builder.Configuration.GetConnectionString("SqlConnection")));
        builder.Services.AddScoped<ICategoryService, CategoryService>();
        builder.Services.AddScoped<IUserService, UserService>();

        var app = builder.Build();
        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI(option => option.RoutePrefix = string.Empty);
            app.UseSwaggerUI(option => option.SwaggerEndpoint("/swagger/v1/swagger.json", "iSmartAPI v1"));
        }

        app.UseHttpsRedirection();
        app.UseAuthentication();
        app.UseAuthorization();

        app.MapControllers();

        app.UseCors("AllowAll");

        app.Run();
    }
}
