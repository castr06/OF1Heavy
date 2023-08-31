// OpenFrame1 Heavy by
/*
  //\ __ __                      ____          _         ___  
 |/_\|\ V / _   _ _ __   __ _   / ___|__ _ ___| |_ _ __ / _ \ 
  /_\|__ __| | | | '_ \ / _` | | |   / _` / __| __| '__| | | |
 / _ \__ __| |_| | | | | (_| | | |__| (_| \__ \ |_| |  | |_| |
/_/ \_\|_|  \__,_|_| |_|\__, |  \____\__,_|___/\__|_|   \___/ 
                        |___/                                 
*/
// Units are Unitless but most slicers will assume mm, so we will assume mm
//Backplate thickness should be 1.6mm with a rubber pad on the back
//first get the buttons mapped out.
//use jlcpcb to get measurements on the pcb board
//need to add extensions next to pico cutout so that they provide some extra places for th pcb to rest
//all hole and button measurements have 7mm on Y and 7mm on X added to them to account for case.

//174.5 usb c location with a 1.6mm height difference above the pcb resting point
//usb c board cutout dimensions 18.5 wide and 3mm deep and 2mm deep cutout in the front of the frame 
echo(version=version());
include <prism-chamfer.scad>;
$fn = 50; //Tells minkowski how many operations to perform in this case its 50*50
case = [360.7, 165, 22.225]; // Case Dimensions 22.225 tall is the height of 7/8in stock
deepest_cutout = [342.7, 151, 17.3]; //Internal Hollow Dimensions 5mm on x and y and 10mm for z if through hole for mx is too thick change z by 1mm thiner, 4mm differnce betwen pcb cutout so that pcb has 2mm all around to rest on 
pcb_cutout = [350, 157.5, 17.3]; //Internal Cut-out for holding pcb inbetween mx thru-hole which is a 5mm difference in height with 2mm for the backplate
backplate_cutout = [354.7, 159, 17.3];
pico_cutout =[43,68, 17.3];
button_radius = 10.32; //Button size is 20.64mm so adding just the slightest amount of space for tolerances
button_height = 9; //Button Height should be about 9mm
button_hole_height = 10; //Button hole Height should be about 10
button_hole_radius = 11; //Holes for the buttons should be around 22mm wide
mx_hole = 14; //Cherry MX thruhole standard is 14mm
usb_c = [5.8, 11, 2.6]; //width (8.4mm) is modified for cylinder dimensions to 5.8
thruhole_height = 13;
thruhole_radius = 3;
pcbhole_height = 7; 
pcbhole_radius = 5;
screwhole_height = 11;
screwhole_radius = 1.65;
pcb_screwhole_radius = 1.025;

module case(){
    difference(){
    polygon_points = [[0,0],[360.7,0],[360.7,165],[0,165]];
    h = 22.225;
    linear_extrude(height = h){ 
        polygon(polygon_points, convexity=2);
    }
    prism_chamfer_mask(polygon_points, start_edge=1, end_edge=4, height=h, side=1.5, corner_slope="deep");
    prism_chamfer_mask(polygon_points, start_edge=1, end_edge=4, height=0, side=1, corner_slope="deep");
    rotate([90,0,90]){
        prism_chamfer_mask(polygon_points, start_edge=1, end_edge=4, height=0, side=1.5, corner_slope="deep");
    }
    translate([0,165,0]){
        rotate([90,0,0]){
            prism_chamfer_mask(polygon_points, start_edge=1, end_edge=4, height=0, side=1.5, corner_slope="deep");
        }
    }
    translate([360.7,165,0]){
        rotate([90,0,0]){
            prism_chamfer_mask(polygon_points, start_edge=1, end_edge=4, height=0, side=1.5, corner_slope="deep");
        }
    }
     translate([360.7,0,0]){
        rotate([90,0,180]){
            prism_chamfer_mask(polygon_points, start_edge=1, end_edge=4, height=0, side=1.5, corner_slope="deep");
        }
    }
    }
}

/*Model Button
linear_extrude(height = button_height, center = true){
    circle(button_radius);
}
*/

/*Button Hole
linear_extrude(height = button_height, center = true){
    circle(button_hole_radius);
}
*/

//Model Assembly

//PCB Supports
//Support 1
difference(){
    translate([325,80.5,7.2]){
        color("white") cube([30,80,5]);
    }
    translate([348.3,132.3,7.2]){
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
    translate([342.5,121.6,1.6]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
}
//Support 2
translate([325,0,7.2]){
    cube([30,50,5]);
}
//Support 3
difference(){
    translate([191,1,7.2]){
        color("orange") cube([54,60,5]);
    }
    translate([209.3,37.3,7.2]){
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
}
//Support 4
difference(){
    translate([242,137,7.2]){
        color("red") cube([40,25,5]);
    }
    translate([260.3,144.3,7.2]){
      linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
}
//Support 5
difference(){
    translate([1,80.5,7.2]){
        color("green") cube([70,80,5]);
    }
    translate([44.3,125.3,7.2]){
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
    translate([52.5,136.5,1.6]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
}

//PCB Mounting Holes
//Mount Hole 1 
translate([348.3,132.3,7.2]){
    difference(){
        linear_extrude(height = pcbhole_height){
            circle(pcbhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
}
//Mount Hole 2
translate([260.3,144.3,7.2]){
    difference(){
        linear_extrude(height = pcbhole_height){
            circle(pcbhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
}
//Mount Hole 3 
translate([209.3,37.3,7.2]){
    difference(){
        linear_extrude(height = pcbhole_height){
            circle(pcbhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
}
//Mount Hole 4 
translate([146.3,104.3,7.2]){
    difference(){
        linear_extrude(height = pcbhole_height){
            circle(pcbhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
}
//Mount Hole 5 
translate([44.3,125.3,7.2]){
    difference(){
        linear_extrude(height = pcbhole_height){
            circle(pcbhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
}

//Backplate mounting Thru-Holes
//Thru-hole 1
translate([342.5,121.6,1.6]){
    difference(){
        linear_extrude(height = thruhole_height){
            circle(thruhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
}
//Thru-hole 2
translate([263.5,27.5,1.6]){
    difference(){
        color("green") linear_extrude(height = thruhole_height){
            circle(thruhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
}
//Thru-hole 3
translate([192.5,138.5,1.6]){
    difference(){
        linear_extrude(height = thruhole_height){
            circle(thruhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
}
//Thru-hole 4    
translate([144.5,49.5,1.6]){
    difference(){
        linear_extrude(height = thruhole_height){
            circle(thruhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
}
//Thru-hole 5
translate([52.5,136.5,1.6]){
    difference(){
        linear_extrude(height = thruhole_height){
            circle(thruhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
}
//Thru-hole 6
translate([60.5,32.5,1.6]){
    difference(){
        linear_extrude(height = thruhole_height){
            circle(thruhole_radius);
        }
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
}


//Cutouts
difference() {
    //Case
    //cube(case);
    case();
translate([0,5,8.5]){
        //USB-C Connector Port
    translate([181.5,0,0]){
            cube(usb_c, center=true);
            translate([-2.9,0,0]){
                rotate(a = [90,0,0]){
                    cylinder(h = 11, d = 2.6, center=true);
                }
            }
            translate([2.9,0,0]){
                rotate(a = [90,0,0]){
                    cylinder(h = 11, d = 2.6, center=true);
                }
            }
        }       
        //USBC PCB Cutout
        translate([181.5,1.5,-1.8]){
            cube([19,5,11], center=true);
        }
        //USBC indent Cutout
        translate([181.5,-6.5,0]){
            rotate([90,0,0]){
                minkowski(){
                    cube([14,8,7], center=true);
                    cylinder(r=1);
                }
            }
        }
    }

    //PCB Mounting Holes
    //Mount Hole 1 
    translate([348.3,132.3,7.2]){
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
    //Mount Hole 2
    translate([260.3,144.3,7.2]){
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
    //Mount Hole 3 
    translate([209.3,37.3,7.2]){
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
    //Mount Hole 4 
    translate([146.3,104.3,7.2]){
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }
    //Mount Hole 5 
    translate([44.3,125.3,7.2]){
        linear_extrude(height = screwhole_height){
            circle(pcb_screwhole_radius);
        }
    }

    //Backplate mounting Thru-Holes
    //Thru-hole 1
    translate([342.5,121.6,1.6]){
         linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
    //Thru-hole 2
    translate([233.6,27.5,1.6]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
    //Thru-hole 3
    translate([192.5,138.5,1.6]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }
    //Thru-hole 4    
    translate([144.5,49.5,1.6]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }

    //Thru-hole 5
    translate([52.5,136.5,1.6]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }

    //Thru-hole 6
    translate([60.5,32.5,1.6]){
        linear_extrude(height = screwhole_height){
            circle(screwhole_radius);
        }
    }

    // Internal Cutouts
    translate([8.5,7,-5.1]){
        color("blue") cube(deepest_cutout);
    }
     translate([5.5,4.5,-10.1]){
        cube(pcb_cutout);
    }
    translate([3,3,-16.2]){ //using -16.2 as that makes the backplate thickness 1.6mm 17.3-1.6=15.7 and adding 0.5mm to bring the plate out of the bottom by 1mm for a lip.
        minkowski(){
            cube(backplate_cutout);
            cylinder(1, center=true);
        }
    }
    translate([282,90,0]){
        cube(pico_cutout);
    }

    //Button Cutouts with Mx Holes add 5mm to x and y measurement to account for the case
    //1
    translate([340,67.1,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //2
    translate([314.8,50.9,7]){
      translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //3
    translate([286.4,48.05,7]){
      translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //4
    translate([260,59.9,7]){
      translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //5
    translate([253,127,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //6
    translate([230.1,142.7,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //7
    translate([180.5,60,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //8
    translate([131,142.8,7]){
         translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //9
    translate([131,111.5,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //10
    translate([108,127,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }    
     //11
    translate([108,96,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //12
    translate([85.5,111.5,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
     //13
    translate([101,59.5,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }    
     //14
    translate([101,32,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }    
     //15
    translate([74.6,47.5,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }    
     //16
    translate([74.6,20,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }    
     //17
    translate([46.2,50.5,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }    
     //18
    translate([46.2,23,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }    
     //19
    translate([19.8,66.5,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }    
     //20
    translate([19.8,39,7]){
        translate([0,0,5]){
            linear_extrude(height = 2){
                square(mx_hole, center = true);
            }
        }
        translate([0,0,5.98]){
            linear_extrude(height = button_hole_height){
                circle(button_hole_radius);
            }
        }
    }
}
