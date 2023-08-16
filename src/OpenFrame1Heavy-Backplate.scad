/*
  //\ __ __                      ____          _         ___  
 |/_\|\ V / _   _ _ __   __ _   / ___|__ _ ___| |_ _ __ / _ \ 
  /_\|__ __| | | | '_ \ / _` | | |   / _` / __| __| '__| | | |
 / _ \__ __| |_| | | | | (_| | | |__| (_| \__ \ |_| |  | |_| |
/_/ \_\|_|  \__,_|_| |_|\__, |  \____\__,_|___/\__|_|   \___/ 
                        |___/                                 
*/
$fn=50; //necessary for minkowski
backplate_cutout = [354.7, 159, 1.6]; //1.6mm thickness
screwhole_height = 11;
screwhole_radius = 2.25;
screw_flange_radius = 4;
//remove 3mm from each x and y on the openframe1heavy measurements
//backplate assembly
difference(){
   minkowski(){
        cube(backplate_cutout);
        cylinder(1, center=true);
    }
    //Backplate mounting Thru-Holes
    //Thru-hole 1
    translate([339.5,118.6,-2]){
         linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
    //Thru-hole 2
    translate([260.5,24.5,-2]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
    //Thru-hole 3
    translate([189.5,135.5,-2]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
    //Thru-hole 4    
    translate([141.5,46.5,-2]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }

    //Thru-hole 5
    translate([49.5,133.5,-2]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }

    //Thru-hole 6
    translate([57.5,29.5,-2]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
    //Backplate mounting Thru-Hole Flanges
    //Thru-hole Flange 1
    translate([339.5,118.6,-9.15]){
         linear_extrude(height = screwhole_height){
            circle(screw_flange_radius);
        }
    }
    //Thru-hole Flange 2
    translate([260.5,24.5,-9.15]){
        linear_extrude(height = screwhole_height){
            circle(screw_flange_radius);
        }
    }
    //Thru-hole Flange 3
    translate([189.5,135.5,-9.15]){
        linear_extrude(height = screwhole_height){
            circle(screw_flange_radius);
        }
    }
    //Thru-hole Flange 4    
    translate([141.5,46.5,-9.15]){
        linear_extrude(height = screwhole_height){
            circle(screw_flange_radius);
        }
    }

    //Thru-hole Flange 5
    translate([49.5,133.5,-9.15]){
        linear_extrude(height = screwhole_height){
            circle(screw_flange_radius);
        }
    }

    //Thru-hole Flange 6
    translate([57.5,29.5,-9.15]){
        linear_extrude(height = screwhole_height){
            circle(screw_flange_radius);
        }
    }
}    