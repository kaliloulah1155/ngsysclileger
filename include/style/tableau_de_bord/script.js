

$(document).ready(function(){

    $('.accordion-header').on('click', function(){
        $(this).css('background','#d4d9f6');
        $(this).find('button').css('font-weight','bold');
        $(this).parent().siblings().find('h2').css('background','#eef0ff');
        $(this).parent().siblings().find('button').css('font-weight','normal'); 
    });

    $('.faqItem').on('click', function(){
        console.log($(this).find('p').html());
     
        var selectedFaq = $(this).find('p').html();
        $(this).parent().siblings().find('.faqItem').removeClass("faqheadertextActive");
        $(this).addClass('faqheadertextActive');
     
     // Informations générales
     // Autres informations
     // Faire une demande
     // Prendre un RDV
     // Comment nous contacter
     // Autres Sujets
     
        if(selectedFaq =='Informations générales'){
          $('.accordion').css('display','none');
          $('#InformationGenerales').css('display','block');
        }
     
        if(selectedFaq =='Autres informations'){
          $('.accordion').css('display','none');
          $('#Autresinformations').css('display','block');
        }
     
        if(selectedFaq =='Faire une demande'){
          $('.accordion').css('display','none');
          $('#Faireunedemande').css('display','block');
        }
     
        if(selectedFaq =='Autres Sujets'){
          $('.accordion').css('display','none');
          $('#AutresSujets').css('display','block');
        }
     
        if(selectedFaq =='Comment nous contacter'){
          $('.accordion').css('display','none');
          $('#Commentnouscontacter').css('display','block');
        }
     
        if(selectedFaq =='Prendre un RDV'){
          $('.accordion').css('display','none');
          $('#PrendreunRDV').css('display','block');
        }
     
    });

});