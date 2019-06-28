using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace STI.Playground.WebApi.Models
{
    public sealed class Cliente
    {
        public Cliente(int id, string nome, int idade, string pais, DateTime dataInscricao, decimal mensalidade)
        {
            Id = id;
            Nome = nome;
            Idade = idade;
            Pais = pais;
            DataInscricao = dataInscricao;
            Mensalidade = mensalidade;
        }
        public int Id { get; }
        public string Nome { get; }
        public int Idade { get; }
        public string Pais { get; }
        public DateTime DataInscricao { get; }
        public decimal Mensalidade { get; }
    }
}
