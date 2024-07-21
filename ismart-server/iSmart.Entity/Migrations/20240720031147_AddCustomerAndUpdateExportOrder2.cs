using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace iSmart.Entity.Migrations
{
    public partial class AddCustomerAndUpdateExportOrder2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ReturnOrder_User_UserId",
                table: "ReturnOrder");

            migrationBuilder.DropIndex(
                name: "IX_ReturnOrder_UserId",
                table: "ReturnOrder");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "ReturnOrder");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "ReturnOrder",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ReturnOrder_UserId",
                table: "ReturnOrder",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_ReturnOrder_User_UserId",
                table: "ReturnOrder",
                column: "UserId",
                principalTable: "User",
                principalColumn: "UserId");
        }
    }
}
