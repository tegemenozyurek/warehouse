namespace Essentials.Models;

public class StockMovement
{
    public int Id { get; set; }
    
    public int WarehouseId { get; set; }
    public Warehouse Warehouse { get; set; }
    
    public int Quantity { get; set; }
    public string MovementType { get; set; } // IN / OUT 
    
    public DateTime MovementDate { get; set; }
}