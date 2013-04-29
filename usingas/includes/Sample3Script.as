// usingas/includes/Sample3Script.as
public function calculate(s:String):String {
    var n:Number = Number(s);
    var t:Number = Math.round((n-32)/1.8*10)/10;
    return String(t);
}