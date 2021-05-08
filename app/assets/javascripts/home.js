/*function build_modalMakeReserve(){
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

document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('rowButtons').addEventListener('click', function (event) {
    if (event.target.dataset.target == "#modalMakeReserve"){

      $.ajax({
        url: '<%= make_reservation_path %>',
        type: 'POST',
        dataType: 'script',
        data: {}
      })

      build_modalMakeReserve();
      
    }
  })
})
*/