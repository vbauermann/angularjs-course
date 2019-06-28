using Dapper;
using Microsoft.AspNetCore.Mvc;
using STI.Playground.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace AngularJS.Course.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    public class ClientesController : Controller
    {
        const string connection = @"Data Source = localhost\SQLEXPRESS01; Initial Catalog = AngularJs_Course; Integrated Security=SSPI;";

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            using (var conexao = new SqlConnection(connection))
            {
                try
                {
                    const string sql = @"SELECT Id, Nome, Idade, Pais, DataInscricao, Mensalidade FROM Clientes";

                    await conexao.OpenAsync();

                    var result = await conexao
                                .QueryAsync<Cliente>(sql);

                    if (!result.Any())
                        return NotFound();

                    var clientes = result
                        .Select(cliente => new Cliente(cliente.Id, cliente.Nome, cliente.Idade, cliente.Pais, cliente.DataInscricao, cliente.Mensalidade))
                        .ToList();

                    return Ok(clientes);

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

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] ClienteInputModel cliente)
        {
            using (var conexao = new SqlConnection(connection))
            {
                try
                {
                    const string sql = @"INSERT INTO Clientes 
                                            (Nome, Pais, DataInscricao, Mensalidade, Idade) 
                                         VALUES 
                                            (@Nome, @Pais, @DataInscricao, @Mensalidade, @Idade)";

                    await conexao.OpenAsync();

                    var id = (await conexao
                                .ExecuteAsync(sql, new
                                {
                                    cliente.Nome,
                                    cliente.Pais,
                                    cliente.DataInscricao,
                                    cliente.Mensalidade,
                                    cliente.Idade
                                }));

                    if (id <= 0)
                        return StatusCode(400, "Não foi possível inserir o cliente");

                    return Ok(new Cliente(id, cliente.Nome, cliente.Idade, cliente.Pais, cliente.DataInscricao, cliente.Mensalidade));

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
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            using (var conexao = new SqlConnection(connection))
            {
                try
                {
                    const string sql = @"DELETE FROM Clientes WHERE Id = @Id";

                    await conexao.OpenAsync();

                    var resultado = await conexao
                                .ExecuteAsync(sql, new
                                {
                                    Id = id
                                });

                    if (resultado <= 0)
                        return StatusCode(400, "Não foi possível remover o cliente");

                    return Ok();

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
    public class ClienteInputModel
    {
        public string Nome { get; set; }
        public int Idade { get; set; }
        public string Pais { get; set; }
        public DateTime DataInscricao { get; set; }
        public decimal Mensalidade { get; set; }
    }
}