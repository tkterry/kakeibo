

$(document).on 'turbolinks:load', -> 
  $('.table-sortable').sortable
    axis: 'y'
    items: '.item'
    update: (e,ui) ->
      item = ui.item
      item_data = item.data()
      params =  { _method: 'put' }
      # window.alert "params:#{item_data.model_name}"
      params[item_data.model_name] = { row_order_position: item.index() }
      $.ajax
        type: 'POST'
        url: item_data.update_url
        dataType: 'json'
        data: params
