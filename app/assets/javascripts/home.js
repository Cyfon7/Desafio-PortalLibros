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
          <div class="modal-body" id="myPayment">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>`, 'text/html');
  document.querySelector('body').prepend(modal.body.firstChild);
};

document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('rowButtons').addEventListener('click', function (event) {
    if (event.target.dataset.target == "#modalMakeReserve"){
      build_modalMakeReserve();
    }
  })

  document.getElementById('leUserBooks').addEventListener('click', function (event) {
    let patern = /(reservation-\d)/g;
    if ( patern.test(event.target.parentNode.parentNode.id) ){
      build_modalPayment();
    }
  })
})
