using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace iSmart.Entity.Migrations
{
    public partial class UpdateReturnOrder : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ReturnOrder_ExportOrder_ExportOrderExportId",
                table: "ReturnOrder");

            migrationBuilder.DropForeignKey(
                name: "FK_ReturnOrder_ImportOrder_ImportOrderImportId",
                table: "ReturnOrder");

            migrationBuilder.DropIndex(
                name: "IX_ReturnOrder_ExportOrderExportId",
                table: "ReturnOrder");

            migrationBuilder.DropIndex(
                name: "IX_ReturnOrder_ImportOrderImportId",
                table: "ReturnOrder");

            migrationBuilder.DropColumn(
                name: "ExportOrderExportId",
                table: "ReturnOrder");

            migrationBuilder.DropColumn(
                name: "ImportOrderImportId",
                table: "ReturnOrder");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ExportOrderExportId",
                table: "ReturnOrder",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ImportOrderImportId",
                table: "ReturnOrder",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ReturnOrder_ExportOrderExportId",
                table: "ReturnOrder",
                column: "ExportOrderExportId");

            migrationBuilder.CreateIndex(
                name: "IX_ReturnOrder_ImportOrderImportId",
                table: "ReturnOrder",
                column: "ImportOrderImportId");

            migrationBuilder.AddForeignKey(
                name: "FK_ReturnOrder_ExportOrder_ExportOrderExportId",
                table: "ReturnOrder",
                column: "ExportOrderExportId",
                principalTable: "ExportOrder",
                principalColumn: "ExportId");

            migrationBuilder.AddForeignKey(
                name: "FK_ReturnOrder_ImportOrder_ImportOrderImportId",
                table: "ReturnOrder",
                column: "ImportOrderImportId",
                principalTable: "ImportOrder",
                principalColumn: "ImportId");
        }
    }
}
