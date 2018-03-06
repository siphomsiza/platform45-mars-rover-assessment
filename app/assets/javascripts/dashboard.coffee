removePeople = (department_id, employee_id) ->
  $.post "/departments/" + department_id + "/remove_employee",
    _method: 'patch'
    id: department_id
    employee:
      employee: employee_id
    (data) ->
      console.log("Successfully posted.")
      location.reload()

addPeople = (department_id, employee_id) ->
  $.post "/departments/" + department_id + "/add_employee",
    _method: 'patch'
    id: department_id
    employee:
      employee: employee_id
    (data) ->
      console.log("Successfully posted.")
      location.reload()

projectSearch = (projects) ->
  $.get "/dashboard",
    search:
      departments: departments

@elemSubmit = (elem) ->
  console.log elem
  # elem.form.submit()

normalizeGrids = ->
  # max_height = 0
  # $('.people').each ->
  #   tmp = $(this).height()
  #   max_height = tmp if tmp > max_height
  #
  # max_width = 0
  # $('.people').each ->
  #   tmp = $(this).width()
  #   max_width = tmp if tmp > max_width

  # $('.people').height max_height
  # $('.people').width max_width
  # $('.people').css 'margin-left', (max_width - 64)/2 + 35
  # $('.people').css 'padding-left', 0

$ ->
  $('input.color[type=radio]').minicolors
    theme: 'bootstrap'

  $('.multiselect').multiselect
    onDropdownHide: (event) ->
      $('.multiselect')[0].form.submit()

  if Helpers.readCookie("signed_in") == 'true'
    $('.grid').shapeshift()
    .on "ss-removed", (event, item) ->
      # TODO: data-id
      project_id = this.id
      item_id = item.id
      console.log("removing person " + item_id + " from project " + project_id)
      removePeople(project_id, item_id)

    .on "ss-added", (event, item) ->
      # TODO: data-id
      project_id = this.id
      item_id = item.id
      console.log("adding person " + item_id + " to project " + project_id)
      addPeople(project_id, item_id)
  else
    $('.grid').shapeshift
      enableDrag: false
      enableCrossDrop: false

  $('.media-heading .action').click (event)->
    event.preventDefault()
    $action = $(event.target).first()
    person_id = $action.closest('.grid-item')[0].id
    project_id = $action.closest('.grid')[0].id
    console.log "removing person " + person_id + " from project " + project_id
    removePeople(project_id, person_id)
    location.reload()

  normalizeGrids()
