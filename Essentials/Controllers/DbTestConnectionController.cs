using Essentials.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Essentials.Controllers;

[ApiController]
[Route("[controller]")]
public class DbTestConnectionController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    // Constructor - Automatically receives DbContext (Dependency Injection)
    public DbTestConnectionController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<IActionResult> TestConnection()
    {
        try
        {
            // Test database connection
            // CanConnect() method checks if the connection is working
            var canConnect = await _context.Database.CanConnectAsync();
            
            if (canConnect)
            {
                return Ok(new 
                { 
                    success = true, 
                    message = "Database connection successful! ✅",
                    timestamp = DateTime.Now
                });
            }
            else
            {
                return BadRequest(new 
                { 
                    success = false, 
                    message = "Could not connect to database ❌",
                    timestamp = DateTime.Now
                });
            }
        }
        catch (Exception ex)
        {
            // Return detailed information in case of error
            return StatusCode(500, new 
            { 
                success = false, 
                message = "Connection error occurred",
                error = ex.Message,
                timestamp = DateTime.Now
            });
        }
    }
}

