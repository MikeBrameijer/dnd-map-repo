using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Web.Hosting;
using DndMapRepo.Models;

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
    }
}
