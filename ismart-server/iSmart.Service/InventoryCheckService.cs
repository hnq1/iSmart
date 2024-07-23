using iSmart.Entity.DTOs.CategoryDTO;
using iSmart.Entity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Service
{
    public interface IInventoryCheckService
    {
        Task<InventoryCheck> CreateInventoryCheckAsync(InventoryCheck inventoryCheck);
    }

    public class InventoryCheckService : IInventoryCheckService
    {
        private readonly iSmartContext _context;
        public InventoryCheckService(iSmartContext context)
        {
            _context = context;
        }

        public async Task<InventoryCheck> CreateInventoryCheckAsync(InventoryCheck inventoryCheck)
        {
            _context.InventoryChecks.Add(inventoryCheck);
            await _context.SaveChangesAsync();
            return inventoryCheck;
        }
    }
}
