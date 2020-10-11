/*

Shopping Guarantee Loader
Copyright 2020, buySAFE, Inc.
20200219
*/
var bs_R=window.bs_R||{},buySAFE=window.buySAFE||{},_GUARANTEE=window._GUARANTEE||buySAFE;
(function(a,b){if(!a.sRoot){a.sRootHost="https://seal.buysafe.com";a.sRoot=a.sRootHost+"/private/rollover/";for(var f=document.getElementsByTagName("script"),d=0;d<f.length;d++){var c=f[d].src.substr(0,100);if(c=c.match(/((.*)\/private\/.*\/)rollover(?:\.unpacked)?\.js/i)||c.match(/()(.*)\/Web\/Seal\/gjs.aspx/i)){a.sRootHost=c[2];a.sRoot=c[1]||a.sRootHost+"/private/rollover/";break}}}a.aExecQ=a.aExecQ||[];a.onEvent=function(a,b,c){if(a){var e=a.addEventListener;a=a.attachEvent;e?e(b,c,!1):a&&a("on"+
b,c)}};a.onLoad=function(b,c){if(b)if(a.fOnLoad||c)b();else a.onEvent(window,"load",b)};a.AddJS=function(b,c,d){var e=document.createElement("script");e.type="text/javascript";e.async=!0;e.src=b;a.onLoad(function(){window.setTimeout(function(){var a=document.getElementsByTagName("script")[0];a&&a.parentNode&&a.parentNode.insertBefore(e,a)},c||10)},!d)};b.Loaded||(b.Hash||(b.Hash=""),b.Guarantee||(b.Guarantee={order:"",total:"",email:""}),b.Seal||(b.Seal={bgcolor:"#FFFFFF"}),b.Button||(b.Button={bgcolor:"#FFFFFF"}),
b.Loaded=1)})(bs_R,buySAFE);var buySAFESealConfig=buySAFE.Seal,buySAFEButtonConfig=buySAFE.Button;
(function(a){function b(b,c){c[b]||(c[b]=function(){a.aExecQ.push([b,c,arguments])})}a.onLoad(function(){a.fOnLoad=1});for(var f=[["+AffiliateSeal"],["+Button"],["+ButtonAjax"],["+ButtonAjaxInvisible"],["+ButtonInvisible"],["+Guarantee"],["+Kickers"],["+Seal"],["+TrustRatingSeal"],["+TrustSeal"],["buysafeGetAffiliateURL"],["Display",1]],d=[{},{pre:"WriteBuySafe"},{pre:"Write",obj:"buySAFE"}],c=0;c<f.length;c++)for(var g=1;g<d.length;g++){var k=d[g],h=f[c];h[g]||(h=h[0].replace(/^\+/,k.pre),b(h,k.obj&&
window[k.obj]||window))}a.AddJS(a.sRoot+"rollover.core.js",100)})(bs_R);
//  Client specific code
var buySAFE = window.buySAFE || {};
var _GUARANTEE = window._GUARANTEE || buySAFE;
if(!_GUARANTEE.Guarantee)  _GUARANTEE.Guarantee = { order:'', total:'', email:'' };
_GUARANTEE.Hash = 'czDUpy7bQNlzmAfj5amnEXeMZFDClWc8hEJVonuvSZwMc4VNx1ZZ2y8%2fUl1xEptkhFDsPCUfT1mgaCbQ74U1Vg%3d%3d';
_GUARANTEE.EnableClientDisplay = 1;
_GUARANTEE.NoEmailAddr = 1;
_GUARANTEE.Version = 'V3';
_GUARANTEE.NoOnTop = 1;
_GUARANTEE.FPC = 1;
//CJSS
// The store setups are now identical

/* AA testing setup
_GUARANTEE.Callback = function (flag) {
  var s = bs_R.oSealRS.UniqueId || '';
  var x = Number(s.substr(-2));
  bs_R.QuickLinkGA( ((x>=10&&x<=19)||(x>=40&&x<=59)||(x>=80&&x<=99)) ? 'Control' : 'Variation' );
};
*/


if(document.location.href.match(/cottonon.com(\/(ZA))/i)) {
  _GUARANTEE.Responsive = { Breakpoints : [ 480, 768 ], Seal : { Breakpoint : 1 } };

  // client-side AB test for ZA only
  _GUARANTEE.setIpDefinition = {
    "tn":"ST13",
    "setIp":[
      {"n":"1","start":"0", "end":"9", "t":"a"},
      {"n":"2","start":"10","end":"19","t":"off"},
      {"n":"3","start":"20","end":"39","t":"a"},
      {"n":"4","start":"40","end":"59","t":"off"},
      {"n":"5","start":"60","end":"79","t":"a"},
      {"n":"6","start":"80","end":"99","t":"off"}
    ]
  };
  _GUARANTEE.Callback = function (flag) {
    var s = bs_R.oSealRS.UniqueId || '';
    var x = Number(s.substr(-2));
    bs_R.QuickLinkGA( ((x>=10&&x<=19)||(x>=40&&x<=59)||(x>=80&&x<=99)) ? 'Control' : 'Variation' );
  };
  _GUARANTEE.QuickLinkGA = 0;
}
else
if(document.location.href.match(/cottonon.com(\/(US|NZ|AU|SG))/i)) {
  _GUARANTEE.Responsive = { Breakpoints : [ 480, 768 ], Seal : { Breakpoint : 1 } };
  _GUARANTEE.QuickLinkGA = 0;
}
else {
  _GUARANTEE.setIpDefinition = { "tn":"ST79", "setIp":[ {"n":"1","start":"0","end":"99","t":"off"} ] };
  _GUARANTEE.QuickLinkGA = 0;
}


_GUARANTEE.ResetKickers = function(f) {

if (document.location.href.match(/Pid=/i) || (window.pageContext && pageContext.type=="product")) {
  _GUARANTEE.InsertKickers = [
    {"loc":"After","anchorTagName":"BUTTON","anchorID":"add-to-cart","anchorClass":"","path":[],"kickerType":"Kicker Custom Minimal2","kickerStyle":"","containerTagName":"DIV","containerStyle":"margin:10px 0 0 0; text-align:center;","responsive":['Minimal1','Minimal2','Minimal2']}
  ];
}

else
if ( document.location.href.match( new RegExp("/bag/", "i") ) ) {
  _GUARANTEE.InsertKickers = [
    {"loc":"Last","anchorTagName":"DIV","anchorID":"","anchorClass":"express-checkouts","path":[],"kickerType":"Kicker Custom Minimal2","kickerStyle":"margin:20px 0 0 0;","containerTagName":"DIV","containerStyle":"margin:auto;display:table;"}
  ];
}

else
if ( document.location.href.match( new RegExp("/checkout/", "i") ) ) {
  _GUARANTEE.InsertKickers = [
    {"loc":"Last","anchorTagName":"DIV","anchorID":"secondary","anchorClass":"","path":[],"kickerType":"Kicker Custom Minimal1","kickerStyle":"margin:20px 0 0 0;","containerTagName":"DIV","containerStyle":"margin:auto;display:table;"}
  ];
}

if(!f) _GUARANTEE.WriteKickers();
}
_GUARANTEE.ResetKickers(1);

_GUARANTEE.WriteSeal();
//CJSE
