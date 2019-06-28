using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using AngularJS.Course.WebApi.Models;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AngularJS.Course.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    public class PaisesController : ControllerBase
    {
        const string connection = @"Data Source = localhost\SQLEXPRESS01; Initial Catalog = AngularJs_Course; Integrated Security=SSPI;";

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            using (var conexao = new SqlConnection(connection))
            {
                try
                {
                    const string sql = @"SELECT Nome, Sigla, Regiao FROM Paises";

                    await conexao.OpenAsync();

                    var result = await conexao
                                .QueryAsync<Pais>(sql);

                    if (!result.Any())
                        return NotFound();

                    var paises = result
                        .Select(pais => new Pais(pais.Nome, pais.Sigla, pais.Regiao))
                        .ToList();

                    return Ok(paises);

                }
                catch (Exception ex)
                {
                    return BadRequest(ex);
                }
                finally
                {
                    conexao.Close();
                }
            }

        }
    }
}