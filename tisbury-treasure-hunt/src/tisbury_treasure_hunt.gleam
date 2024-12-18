import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(str, int) = place_location
  #(int, str)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  let #(str1, int1) = place_location
  let #(int2, str2) = treasure_location

  str1 == str2 && int1 == int2
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let #(_, #(str2, int)) = place

  list.count(treasures, fn(x) {
    let #(_, #(x_int, x_str2)) = x
    str2 == x_str2 && int == x_int
  })
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case place {
    #(name, _) ->
      case name {
        "Abandoned Lighthouse" ->
          case found_treasure {
            #(found_name, _) if found_name == "Brass Spyglass" -> True
            _ -> False
          }
        "Stormy Breakwater" ->
          case found_treasure {
            #(found_name, _) if found_name == "Amethyst Octopus" ->
              case desired_treasure {
                #(desired_name, _)
                  if desired_name == "Crystal Crab"
                  || desired_name == "Glass Starfish"
                -> True
                _ -> False
              }
            _ -> False
          }
        "Harbor Managers Office" ->
          case found_treasure {
            #(found_name, _) if found_name == "Vintage Pirate Hat" ->
              case desired_treasure {
                #(desired_name, _)
                  if desired_name == "Model Ship in Large Bottle"
                  || desired_name == "Antique Glass Fishnet Float"
                -> True
                _ -> False
              }
            _ -> False
          }
        _ -> False
      }
  }
}
