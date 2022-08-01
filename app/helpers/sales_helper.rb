module SalesHelper
  
  # doing it this way can now also query more specific active sales by city, discount, etc
  def active_sale?
    Sale.active.any?
  end
  
end