using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MS_COE_Day1
{
    /// <summary>
    /// Summary description for WebService2
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService2 : System.Web.Services.WebService
    {
        public WebService2()
        {
            //Uncomment the following if using designed components 
            //InitializeComponent(); 
        }

        string[,] stocks =
        {
            {"RELIND", "Reliance Industries", "1060.15"},
            {"ICICI", "ICICI Bank", "911.55"},
            {"JSW", "JSW Steel", "1201.25"},
            {"WIPRO", "Wipro Limited", "1194.65"},
            {"SATYAM", "Satyam Computers", "91.10"}
        };

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public double GetPrice(string symbol)
        {
            //it takes the symbol as parameter and returns price
            for (int i = 0; i < stocks.GetLength(0); i++)
            {
                if (String.Compare(symbol, stocks[i, 0], true) == 0)
                    return Convert.ToDouble(stocks[i, 2]);
            }

            return 0;
        }

        [WebMethod]
        public string GetName(string symbol)
        {
            // It takes the symbol as parameter and 
            // returns name of the stock
            for (int i = 0; i < stocks.GetLength(0); i++)
            {
                if (String.Compare(symbol, stocks[i, 0], true) == 0)
                    return stocks[i, 1];
            }

            return "Stock Not Found";
        }
    }
}