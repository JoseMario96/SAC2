using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SAC.metodos
{
    public class metodosOdontograma
    {
        consulta.consulta consultar = new consulta.consulta();
        conexion.conexion con = new conexion.conexion();

        public void agregarOdontograma(String col, String die, String secc, String cont)
        {
            consultar.ejecutar_consulta("INSERT INTO `bd_sac`.`tbl_odontograma` (`colorOdontograma`, `dienteOdontograma`, `seccionOdontograma`, `contextoOdontograma`) VALUES ('" + col + "', '" + die + "', '" + secc + "', '" + cont + "');", con.abrir_conexion()).ExecuteNonQuery();
            con.cerrar_Conexion();
        }
    }
}