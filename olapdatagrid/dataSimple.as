/* data:Object = {
    customer:"AAA", 
    product:"ColdFusion",
    year:"2005",
    quarter:"Q1"
    revenue: "100.00" 
}
*/

[Bindable]
private var flatData:ArrayCollection = new ArrayCollection(
[
 {customer:"AAA", product:"ColdFusion", year:2006, quarter:"Q1", revenue:210, cost:25},
 {customer:"AAA", product:"Flex", year:2006, quarter:"Q2", revenue:210, cost:25},
 {customer:"AAA", product:"Dreamweaver", year:2006, quarter:"Q3", revenue:250, cost:125},
 {customer:"AAA", product:"Flash", year:2006, quarter:"Q4", revenue:430, cost:75},

 {customer:"BBB", product:"ColdFusion", year:2006, quarter:"Q2", revenue:125, cost:20},
 {customer:"BBB", product:"Flex", year:2006, quarter:"Q3", revenue:210, cost:20},
 {customer:"BBB", product:"Dreamweaver", year:2006, quarter:"Q4", revenue:320, cost:120},
 {customer:"BBB", product:"Flash", year:2006, quarter:"Q1", revenue:280, cost:70},

 {customer:"CCC", product:"ColdFusion", year:2006, quarter:"Q3", revenue:375, cost:120},
 {customer:"CCC", product:"Flex", year:2006, quarter:"Q4", revenue:430, cost:120},
 {customer:"CCC", product:"Dreamweaver", year:2006, quarter:"Q1", revenue:470, cost:220},
 {customer:"CCC", product:"Flash", year:2006, quarter:"Q2", revenue:570, cost:170},

 {customer:"AAA", product:"ColdFusion", year:2006, quarter:"Q4", revenue:215, cost:90},
 {customer:"AAA", product:"Flex", year:2006, quarter:"Q1", revenue:210, cost:90},
 {customer:"AAA", product:"Dreamweaver", year:2006, quarter:"Q2", revenue:175, cost:190},
 {customer:"AAA", product:"Flash", year:2006, quarter:"Q3", revenue:670, cost:75},

 {customer:"BBB", product:"ColdFusion", year:2006, quarter:"Q1", revenue:175, cost:20},
 {customer:"BBB", product:"Flex", year:2006, quarter:"Q2", revenue:210, cost:20},
 {customer:"BBB", product:"Dreamweaver", year:2006, quarter:"Q3", revenue:120, cost:120},
 {customer:"BBB", product:"Flash", year:2006, quarter:"Q4", revenue:310, cost:70},

 {customer:"CCC", product:"ColdFusion", year:2006, quarter:"Q1", revenue:385, cost:120},
 {customer:"CCC", product:"Flex", year:2006, quarter:"Q2", revenue:340, cost:120},
 {customer:"CCC", product:"Dreamweaver", year:2006, quarter:"Q3", revenue:470, cost:220},
 {customer:"CCC", product:"Flash", year:2006, quarter:"Q4", revenue:270, cost:170},


 {customer:"AAA", product:"ColdFusion", year:2007, quarter:"Q1", revenue:100, cost:25},
 {customer:"AAA", product:"Flex", year:2007, quarter:"Q2", revenue:150, cost:25},
 {customer:"AAA", product:"Dreamweaver", year:2007, quarter:"Q3", revenue:200, cost:125},
 {customer:"AAA", product:"Flash", year:2007, quarter:"Q4", revenue:300, cost:75},

 {customer:"BBB", product:"ColdFusion", year:2007, quarter:"Q2", revenue:175, cost:20},
 {customer:"BBB", product:"Flex", year:2007, quarter:"Q3", revenue:100, cost:20},
 {customer:"BBB", product:"Dreamweaver", year:2007, quarter:"Q4", revenue:270, cost:120},
 {customer:"BBB", product:"Flash", year:2007, quarter:"Q1", revenue:370, cost:70},

 {customer:"CCC", product:"ColdFusion", year:2007, quarter:"Q3", revenue:410, cost:120},
 {customer:"CCC", product:"Flex", year:2007, quarter:"Q4", revenue:300, cost:320},
 {customer:"CCC", product:"Dreamweaver", year:2007, quarter:"Q1", revenue:510, cost:220},
 {customer:"CCC", product:"Flash", year:2007, quarter:"Q2", revenue:620, cost:170},

 {customer:"AAA", product:"ColdFusion", year:2007, quarter:"Q4", revenue:215, cost:90},
 {customer:"AAA", product:"Flex", year:2007, quarter:"Q1", revenue:210, cost:90},
 {customer:"AAA", product:"Dreamweaver", year:2007, quarter:"Q2", revenue:175, cost:190},
 {customer:"AAA", product:"Flash", year:2007, quarter:"Q3", revenue:420, cost:75},

 {customer:"BBB", product:"ColdFusion", year:2007, quarter:"Q1", revenue:240, cost:20},
 {customer:"BBB", product:"Flex", year:2007, quarter:"Q2", revenue:100, cost:20},
 {customer:"BBB", product:"Dreamweaver", year:2007, quarter:"Q3", revenue:270, cost:120},
 {customer:"BBB", product:"Flash", year:2007, quarter:"Q4", revenue:370, cost:70},

 {customer:"CCC", product:"ColdFusion", year:2007, quarter:"Q1", revenue:375, cost:120},
 {customer:"CCC", product:"Flex", year:2007, quarter:"Q2", revenue:420, cost:120},
 {customer:"CCC", product:"Dreamweaver", year:2007, quarter:"Q3", revenue:680, cost:220},
 {customer:"CCC", product:"Flash", year:2007, quarter:"Q4", revenue:570, cost:170}
         
]);