/* 
 * Handle for SAO Cable Extension
 *
 * Design: hxr.social/@thomasflummer
 *
 * License: CC-BY-SA
 *
 */

module cover(length, width, height, corner_radius)
{
    difference()
    {
        union()
        {
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(length/2 - corner_radius), y*(width/2 - corner_radius), height/2-1])
                            cylinder(r = corner_radius-1, h = height, center = true, $fn = 150);
                    }
                }

                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(length/2 - corner_radius), y*(width/2 - corner_radius), height/2])
                            cylinder(r = corner_radius, h = height, center = true, $fn = 150);
                    }
                }
            }        
        }
        union()
        {
            // insert cutouts
            for(x = [-1, 1])
            {
                for(y = [-1, 1])
                {
                    translate([x*(length/2 - corner_radius), y*(width/2 - corner_radius), (height)/2])
                        cylinder(d = 3.3, h =  height+0.01, center = true, $fn = 50);
                }
            }

            // back sao connector
            translate([-length/2+22.68, width/2-9.33, 0])
                cube([16, 9, 10], center = true);
                
            // front sao connector pins
            translate([length/2-25.22, width/2-9.33, 0])
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(9/2 - 1), y*(5/2 - 1), height - 2/2])
                            cylinder(r = 1, h = 2.1, center = true, $fn = 50);
                    }
                }
            }

            // flipper zero pins
            translate([-20.32, -(width/2-1.27), 0])
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(17.78/2), y*(0), height - 2/2])
                            cylinder(r = 1.27-0.4, h = 2.1, center = true, $fn = 50);
                    }
                }
            }

            translate([17.78, -(width/2-1.27), 0])
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(22.86/2), y*(0), height - 2/2])
                            cylinder(r = 1.27-0.4, h = 2.1, center = true, $fn = 50);
                    }
                }
            }
            
        }
    }
}

cover(86, 36, 4, 3);



