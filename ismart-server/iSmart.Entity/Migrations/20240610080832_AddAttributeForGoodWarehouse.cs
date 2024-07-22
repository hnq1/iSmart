using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace iSmart.Entity.Migrations
{
    public partial class AddAttributeForGoodWarehouse : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MeasuredUnitValue",
                table: "MeasuredUnit");

            migrationBuilder.DropColumn(
                name: "InStock",
                table: "Goods");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "MeasuredUnitValue",
                table: "MeasuredUnit",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "InStock",
                table: "Goods",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
