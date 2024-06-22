using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace iSmart.Entity.Migrations
{
    public partial class AddWarehouseDestinationToImportOrder : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "DeliveryId",
                table: "Delivery",
                newName: "DeliveyId");

            migrationBuilder.AddColumn<int>(
                name: "WarehouseDestinationId",
                table: "ImportOrder",
                type: "int",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "WarehouseDestinationId",
                table: "ImportOrder");

            migrationBuilder.RenameColumn(
                name: "DeliveyId",
                table: "Delivery",
                newName: "DeliveryId");
        }
    }
}
