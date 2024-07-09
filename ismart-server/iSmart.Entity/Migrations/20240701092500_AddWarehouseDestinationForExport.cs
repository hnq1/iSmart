using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace iSmart.Entity.Migrations
{
    public partial class AddWarehouseDestinationForExport : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "WarehouseDestinationId",
                table: "ExportOrder",
                type: "int",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "WarehouseDestinationId",
                table: "ExportOrder");
        }
    }
}
