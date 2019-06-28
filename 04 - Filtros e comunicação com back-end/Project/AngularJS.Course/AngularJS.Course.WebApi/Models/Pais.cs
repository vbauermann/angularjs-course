using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularJS.Course.WebApi.Models
{
    public sealed class Pais
    {
        public Pais(string nome, string sigla, string regiao)
        {
            Nome = nome;
            Sigla = sigla;
            Regiao = regiao;
        }

        public string Nome { get; }
        public string Sigla { get; }
        public string Regiao { get; }
    }
}
