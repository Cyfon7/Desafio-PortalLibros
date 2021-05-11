function build_modalMakeReserve(){
  var modal = new DOMParser().parseFromString(`<div class="modal fade" id="modalMakeReserve" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalMakeReserveLabel">Make Reservation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" id="myForm">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>`, 'text/html');
  document.querySelector('body').prepend(modal.body.firstChild);
};

function build_modalPayment(){
  var modal = new DOMParser().parseFromString(`<div class="modal fade" id="modalPayment" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalPaymentLabel">Make Payment</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="field">
              <span id="message">Form will lock in </span>
              <span id="minutes"></span>:<span id="seconds"></span>
            </div>
            <div id="myPayment">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>`, 'text/html');
  document.querySelector('body').prepend(modal.body.firstChild);
};

function displayTimer(miliseconds){
  let end = miliseconds / 1000;
  let min = $("#minutes")[0];
  let sec = $("#seconds")[0];

  if (end > 0) {
    let ticker = setInterval(function(){      
      end--;
      if (end <= 0) { clearInterval(ticker); }

      let secs = end;
      let mins = Math.floor(secs / 60);
      secs -= mins * 60;

      min.innerHTML = ("00" + mins).slice(-2);
      sec.innerHTML = ("00" + secs).slice(-2);
    }, 1000);
  }
};

document.addEventListener('turbolinks:load', function(){
  build_modalMakeReserve();
  build_modalPayment();

  document.getElementById('rowButtons').addEventListener('click', function (event) {
    if ( event.target.dataset.target == "#modalMakeReserve" ){
      $('#modalMakeReserve').modal('show');

      document.getElementById('modalMakeReserve').addEventListener('click', function(event){
        if( event.target.id == "btnReserve" ){
          setTimeout(function(){
            $('#modalMakeReserve').modal('hide');
          }, 400);
        }
      })
    }
  })

  document.getElementById('leUserBooks').addEventListener('click', function (event) {
    let patern = /(reservation-\d)/g;
    if ( patern.test(event.target.parentNode.parentNode.id) ){
      if ( event.target.dataset.target == "#modalPayment" ){
        $('#modalPayment').modal('show');
      
        const timeout = 120000;
        displayTimer(timeout);

        setTimeout(function (){
          $('#modalPayment').modal('hide');
        }, timeout);

        document.getElementById('modalPayment').addEventListener('click', function(event){
          if( event.target.id == "btnBuy" ){
            setTimeout(function(){
              $('#modalPayment').modal('hide');
            }, 400);
          }
        })
      }
    }
  })

})
