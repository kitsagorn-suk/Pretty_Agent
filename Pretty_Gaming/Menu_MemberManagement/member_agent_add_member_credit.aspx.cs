using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp.Authenticators;
using RestSharp;
using Newtonsoft.Json.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace Pretty_Gaming
{
    public partial class member_agent_add_member_credit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder sbItem = new StringBuilder();
            if (Request.Cookies["Profile"] != null)
            {
                //int PT = int.Parse(Request.Cookies["Profile"]["positionTracking"]);
                //for (int i = 1; i <= PT; i++)
                //{
                //    sbItem.Append("<option value='" + i + "%'>" + i + "%</option>");
                //}
                //literal_pt.Text = sbItem.ToString();

                ////{% 0d % 0a "normalBaccarat": 0,% 0d % 0a "super6Baccarat": 0,% 0d % 0a "cowCowBaccarat": 0,% 0d % 0a "dragonTiger": 0,% 0d % 0a "roulette": 0,% 0d % 0a "sicBo": 0 % 0d % 0a}
                //var data = Request.Cookies["Profile"]["commission"].ToString();
                //data = data.Replace("%", "");
                //data = data.Replace("0d", "");
                //data = data.Replace("0a", "");
                //dynamic obj = JsonConvert.DeserializeObject(data.ToString());

                ////Response.Write(obj.normalBaccarat);

                //ddl_OriBar.Items.FindByValue(obj.normalBaccarat.ToString() + ".0").Selected = true;
            }
        }
    }
}