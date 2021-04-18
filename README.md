# README
In progress !





<%= form_with(model: bill) do |form| %>
  <% if bill.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(bill.errors.count, "error") %> prohibited this bill from being saved:</h2>

      <ul>
        <% bill.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= form.label :name %>
    <%= form.text_field :name %>
  </div>

  <div class="field">
    <%= form.label :description %>
    <%= form.text_area :description %>
  </div>

  <div class="field">
    <%= form.label :amount %>
    <%= form.text_field :amount %>
  </div>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>
