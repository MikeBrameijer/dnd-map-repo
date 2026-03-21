using DndMapRepo.Repos;
using System;
using System.Drawing;

namespace DndMapRepo
{
    public partial class Player : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMap();
            }
        }

        private void LoadMap()
        {
            int mapId;
            var idValue = Request.QueryString["id"];

            if (!int.TryParse(idValue, out mapId))
            {
                Response.Write("A valid map id was not provided.");
                Response.End();
                return;
            }

            var map = MapRepository.GetMapById(mapId);

            if (map == null)
            {
                Response.Write("The selected map could not be found.");
                Response.End();
                return;
            }

            vidMap.Attributes["src"] = ResolveUrl(map.File);
        }
    }
}