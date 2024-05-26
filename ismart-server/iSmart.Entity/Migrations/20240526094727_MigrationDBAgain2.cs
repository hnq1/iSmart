using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace iSmart.Entity.Migrations
{
    public partial class MigrationDBAgain2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Goods_Warehouse_WarehouseId",
                table: "Goods");

            migrationBuilder.DropIndex(
                name: "IX_Goods_WarehouseId",
                table: "Goods");

            migrationBuilder.DropColumn(
                name: "WarehouseId",
                table: "Goods");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "WarehouseId",
                table: "Goods",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Goods_WarehouseId",
                table: "Goods",
                column: "WarehouseId");

            migrationBuilder.AddForeignKey(
                name: "FK_Goods_Warehouse_WarehouseId",
                table: "Goods",
                column: "WarehouseId",
                principalTable: "Warehouse",
                principalColumn: "WarehouseId");
        }
    }
}
