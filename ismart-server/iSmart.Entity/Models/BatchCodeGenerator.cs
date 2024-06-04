using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.Models
{
    public static class BatchCodeGenerator
    {
        private static int _counter = 0;
        private static readonly object _lock = new object();

        public static string GenerateBatchCode(string warehousePrefix)
        {
            lock (_lock)
            {
                _counter++;
                return $"{warehousePrefix}{DateTime.Now:yyyyMMdd}{_counter:D3}";
            }
        }
    }

}
