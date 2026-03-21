using DndMapRepo.Models;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Hosting;

namespace DndMapRepo.Repos
{
    public static class MapRepository
    {
        private static readonly string FilePath = HostingEnvironment.MapPath("~/App_Data/maps.json");

        public static List<MapVideo> GetMaps()
        {
            var maps = new List<MapVideo>();

            if (!File.Exists(FilePath))
            {
                return maps;
            }

            var json = File.ReadAllText(FilePath);

            if (string.IsNullOrWhiteSpace(json))
            {
                return maps;
            }
            
            maps = JsonConvert.DeserializeObject<List<MapVideo>>(json) ?? maps;
            return maps;
        }

        public static MapVideo GetMapById(int id)
        {
            var maps = GetMaps();
            return maps.FirstOrDefault(x => x.Id == id);
        }
    }
}
