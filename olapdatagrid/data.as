/* data:Object = {
    customer:"IBM", 
    country:"US",
    state:"MA",
    region:"NewEngland",
    product:"ColdFusion",
    year:2005,
    quarter:"Q1"
    month:"January",
    revenue: 12,575.00 ,
    cost: 500
}
*/

[Bindable]
private var flatData:ArrayCollection = new ArrayCollection(
[
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"ColdFusion", year:2006, quarter:"Q1", month:"January", revenue:100, cost:25},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flex", year:2006, quarter:"Q1", month:"February", revenue:150, cost:25},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Dreamweaver", year:2006, quarter:"Q1", month:"January", revenue:200, cost:125},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flash", year:2006, quarter:"Q1", month:"January", revenue:300, cost:75},

 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"ColdFusion", year:2006, quarter:"Q2", month:"April", revenue:200, cost:25},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flex", year:2006, quarter:"Q2", month:"April", revenue:350, cost:25},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Dreamweaver", year:2006, quarter:"Q2", month:"April", revenue:400, cost:125},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flash", year:2006, quarter:"Q2", month:"April", revenue:600, cost:75},

 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"ColdFusion", year:2006, quarter:"Q3", month:"July", revenue:100, cost:45},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flex", year:2006, quarter:"Q3", month:"August", revenue:150, cost:5},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Dreamweaver", year:2006, quarter:"Q3", month:"July", revenue:200, cost:95},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flash", year:2006, quarter:"Q3", month:"August", revenue:300, cost:25},

 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"ColdFusion", year:2006, quarter:"Q4", month:"November", revenue:100, cost:85},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flex", year:2006, quarter:"Q4", month:"November", revenue:150, cost:15},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Dreamweaver", year:2006, quarter:"Q4", month:"October", revenue:500, cost:225},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flash", year:2006, quarter:"Q4", month:"October", revenue:300, cost:175},
 

 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"ColdFusion", year:2006, quarter:"Q1", month:"January", revenue:175, cost:20},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flex", year:2006, quarter:"Q1", month:"January", revenue:100, cost:20},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Dreamweaver", year:2006, quarter:"Q1", month:"January", revenue:270, cost:120},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flash", year:2006, quarter:"Q1", month:"January", revenue:370, cost:70},

 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"ColdFusion", year:2006, quarter:"Q2", month:"April", revenue:270, cost:20},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flex", year:2006, quarter:"Q2", month:"April", revenue:300, cost:20},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Dreamweaver", year:2006, quarter:"Q2", month:"April", revenue:470, cost:120},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flash", year:2006, quarter:"Q2", month:"April", revenue:670, cost:70},

 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"ColdFusion", year:2006, quarter:"Q3", month:"July", revenue:170, cost:40},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flex", year:2006, quarter:"Q3", month:"August", revenue:100, cost:10},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Dreamweaver", year:2006, quarter:"Q3", month:"July", revenue:270, cost:90},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flash", year:2006, quarter:"Q3", month:"August", revenue:370, cost:20},

 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"ColdFusion", year:2006, quarter:"Q4", month:"November", revenue:170, cost:80},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flex", year:2006, quarter:"Q4", month:"November", revenue:100, cost:10},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Dreamweaver", year:2006, quarter:"Q4", month:"October", revenue:70, cost:220},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flash", year:2006, quarter:"Q4", month:"October", revenue:370, cost:170},


 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"ColdFusion", year:2006, quarter:"Q1", month:"January", revenue:375, cost:120},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flex", year:2006, quarter:"Q1", month:"February", revenue:300, cost:120},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Dreamweaver", year:2006, quarter:"Q1", month:"February", revenue:470, cost:220},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flash", year:2006, quarter:"Q1", month:"February", revenue:570, cost:170},

 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"ColdFusion", year:2006, quarter:"Q2", month:"April", revenue:570, cost:120},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flex", year:2006, quarter:"Q2", month:"May", revenue:500, cost:120},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Dreamweaver", year:2006, quarter:"Q2", month:"May", revenue:670, cost:220},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flash", year:2006, quarter:"Q2", month:"April", revenue:870, cost:170},

 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"ColdFusion", year:2006, quarter:"Q3", month:"July", revenue:370, cost:140},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flex", year:2006, quarter:"Q3", month:"August", revenue:300, cost:110},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Dreamweaver", year:2006, quarter:"Q3", month:"July", revenue:470, cost:910},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flash", year:2006, quarter:"Q3", month:"August", revenue:570, cost:120},

 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"ColdFusion", year:2006, quarter:"Q4", month:"November", revenue:370, cost:180},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flex", year:2006, quarter:"Q4", month:"November", revenue:300, cost:110},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Dreamweaver", year:2006, quarter:"Q4", month:"October", revenue:270, cost:320},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flash", year:2006, quarter:"Q4", month:"October", revenue:570, cost:270},




 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"ColdFusion", year:2007, quarter:"Q1", month:"January", revenue:215, cost:90},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flex", year:2007, quarter:"Q1", month:"February", revenue:210, cost:90},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Dreamweaver", year:2007, quarter:"Q1", month:"January", revenue:175, cost:190},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flash", year:2007, quarter:"Q1", month:"January", revenue:420, cost:75},

 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"ColdFusion", year:2007, quarter:"Q2", month:"April", revenue:175, cost:90},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flex", year:2007, quarter:"Q2", month:"April", revenue:375, cost:90},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Dreamweaver", year:2007, quarter:"Q2", month:"April", revenue:400, cost:190},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flash", year:2007, quarter:"Q2", month:"April", revenue:600, cost:75},

 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"ColdFusion", year:2007, quarter:"Q3", month:"July", revenue:100, cost:45},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flex", year:2007, quarter:"Q3", month:"August", revenue:175, cost:5},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Dreamweaver", year:2007, quarter:"Q3", month:"July", revenue:175, cost:95},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flash", year:2007, quarter:"Q3", month:"August", revenue:420, cost:90},

 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"ColdFusion", year:2007, quarter:"Q4", month:"November", revenue:100, cost:85},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flex", year:2007, quarter:"Q4", month:"November", revenue:175, cost:21},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Dreamweaver", year:2007, quarter:"Q4", month:"October", revenue:750, cost:290},
 {customer:"AAA", country:"US", state:"MA", region:"NewEngland", product:"Flash", year:2007, quarter:"Q4", month:"October", revenue:420, cost:175},
 

 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"ColdFusion", year:2007, quarter:"Q1", month:"January", revenue:175, cost:20},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flex", year:2007, quarter:"Q1", month:"January", revenue:100, cost:20},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Dreamweaver", year:2007, quarter:"Q1", month:"January", revenue:270, cost:120},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flash", year:2007, quarter:"Q1", month:"January", revenue:370, cost:70},

 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"ColdFusion", year:2007, quarter:"Q2", month:"April", revenue:270, cost:20},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flex", year:2007, quarter:"Q2", month:"April", revenue:420, cost:20},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Dreamweaver", year:2007, quarter:"Q2", month:"April", revenue:470, cost:120},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flash", year:2007, quarter:"Q2", month:"April", revenue:670, cost:70},

 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"ColdFusion", year:2007, quarter:"Q3", month:"July", revenue:170, cost:40},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flex", year:2007, quarter:"Q3", month:"August", revenue:100, cost:10},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Dreamweaver", year:2007, quarter:"Q3", month:"July", revenue:270, cost:90},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flash", year:2007, quarter:"Q3", month:"August", revenue:370, cost:20},

 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"ColdFusion", year:2007, quarter:"Q4", month:"November", revenue:170, cost:80},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flex", year:2007, quarter:"Q4", month:"November", revenue:100, cost:10},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Dreamweaver", year:2007, quarter:"Q4", month:"October", revenue:70, cost:220},
 {customer:"BBB", country:"US", state:"CT", region:"NewEngland", product:"Flash", year:2007, quarter:"Q4", month:"October", revenue:370, cost:170},


 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"ColdFusion", year:2007, quarter:"Q1", month:"January", revenue:375, cost:120},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flex", year:2007, quarter:"Q1", month:"February", revenue:420, cost:120},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Dreamweaver", year:2007, quarter:"Q1", month:"February", revenue:470, cost:220},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flash", year:2007, quarter:"Q1", month:"February", revenue:570, cost:170},

 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"ColdFusion", year:2007, quarter:"Q2", month:"April", revenue:570, cost:120},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flex", year:2007, quarter:"Q2", month:"May", revenue:750, cost:120},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Dreamweaver", year:2007, quarter:"Q2", month:"May", revenue:670, cost:220},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flash", year:2007, quarter:"Q2", month:"April", revenue:870, cost:170},

 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"ColdFusion", year:2007, quarter:"Q3", month:"July", revenue:370, cost:140},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flex", year:2007, quarter:"Q3", month:"August", revenue:420, cost:110},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Dreamweaver", year:2007, quarter:"Q3", month:"July", revenue:470, cost:910},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flash", year:2007, quarter:"Q3", month:"August", revenue:570, cost:120},

 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"ColdFusion", year:2007, quarter:"Q4", month:"November", revenue:370, cost:180},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flex", year:2007, quarter:"Q4", month:"November", revenue:420, cost:110},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Dreamweaver", year:2007, quarter:"Q4", month:"October", revenue:270, cost:320},
 {customer:"CCC", country:"US", state:"CA", region:"WestCoast", product:"Flash", year:2007, quarter:"Q4", month:"October", revenue:570, cost:270}
         
]);
