let appNameM = $(".appName").val();
let matdepart = 'G210510';

let link_urlM =
    "/" +
    appNameM +
    "/interface/tpl/" +
    appNameM +
    "/PRS/matricule/matricule.php";






    //Debut phase 1-Traitement des departements
ajaxmat()
.then((results) => {

     
    $('.matricul').val(matdepart);


matdepart = results[0];


//console.log(matdepart);


    
    let tabNgser=["N","G","S","E","R"];
    let newMatricule="";
    
    
    let recup2LastChar=parseInt(matdepart.slice(5, 7));
    let recupLetter=matdepart.slice(0, 1);
     
    let today = new Date().toISOString().slice(0, 10); 
    let mois=today.slice(5,7);
    let annee=today.slice(2,4);
    
    if (1 <= recup2LastChar &&  recup2LastChar<99 ){
        recup2LastChar=recup2LastChar+1;
        newMatricule=recupLetter+""+annee+""+mois+""+recup2LastChar;
         $('.matricul').val(newMatricule);

    }
    else if(recup2LastChar=99){
        recup2LastChar=1;
     
        
        if(tabNgser.indexOf(recupLetter) !== -1){
    
            newIndex=tabNgser.indexOf(recupLetter)+1;
            newVal=tabNgser[newIndex];
            newMatricule=newVal+""+annee+""+mois+""+recup2LastChar;
            $('.matricul').val(newMatricule);
    
        } else{
            console.log("Value does not exists!")
        }
    }
    

     
     







})
.catch((err) => console.log(err));




function ajaxmat() {
return new Promise((resolve, reject) => {
    $.ajax({
        url: link_urlM,
        type: "POST",
        dataType: "json",
        // data: {
        //     key: "value",
        // },
        success: function(data) {
            resolve(data);
        },
        error: function(error) {
            reject(error);
        },
    });
});
}