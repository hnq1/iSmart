using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace iSmart.Entity.Migrations
{
    public partial class AddManufactureAndExpiryDateFieldsToImportOrderDetail : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "ExpiryDate",
                table: "ImportOrderDetail",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "ManufactureDate",
                table: "ImportOrderDetail",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ExpiryDate",
                table: "ImportOrderDetail");

            migrationBuilder.DropColumn(
                name: "ManufactureDate",
                table: "ImportOrderDetail");
        }
    }
}
