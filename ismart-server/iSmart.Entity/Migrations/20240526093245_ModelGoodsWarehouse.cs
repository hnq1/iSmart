using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace iSmart.Entity.Migrations
{
    public partial class ModelGoodsWarehouse : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Goods_Storage_StorageId",
                table: "Goods");

            migrationBuilder.AlterColumn<int>(
                name: "WarehouseId",
                table: "Goods",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.CreateTable(
                name: "GoodsWarehouses",
                columns: table => new
                {
                    GoodsId = table.Column<int>(type: "int", nullable: false),
                    WarehouseId = table.Column<int>(type: "int", nullable: false),
                    Quantity = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GoodsWarehouses", x => new { x.GoodsId, x.WarehouseId });
                    table.ForeignKey(
                        name: "FK_GoodsWarehouses_Goods_GoodsId",
                        column: x => x.GoodsId,
                        principalTable: "Goods",
                        principalColumn: "GoodsId");
                    table.ForeignKey(
                        name: "FK_GoodsWarehouses_Warehouse_WarehouseId",
                        column: x => x.WarehouseId,
                        principalTable: "Warehouse",
                        principalColumn: "WarehouseId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_GoodsWarehouses_WarehouseId",
                table: "GoodsWarehouses",
                column: "WarehouseId");

            migrationBuilder.AddForeignKey(
                name: "FK_Goods_Warehouse_WarehouseId",
                table: "Goods",
                column: "WarehouseId",
                principalTable: "Warehouse",
                principalColumn: "WarehouseId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Goods_Warehouse_WarehouseId",
                table: "Goods");

            migrationBuilder.DropTable(
                name: "GoodsWarehouses");

            migrationBuilder.AlterColumn<int>(
                name: "WarehouseId",
                table: "Goods",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Goods_Storage_StorageId",
                table: "Goods",
                column: "WarehouseId",
                principalTable: "Warehouse",
                principalColumn: "WarehouseId");
        }
    }
}
