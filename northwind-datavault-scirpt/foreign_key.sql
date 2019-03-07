----- 1 
ALTER TABLE [dbo].[sat_customer]  WITH CHECK ADD  CONSTRAINT [FK_sat_customer_hub_customer] FOREIGN KEY([hub_customer_key])
REFERENCES [dbo].[hub_customer] ([hub_customer_key])
GO

ALTER TABLE [dbo].[sat_customer] CHECK CONSTRAINT [FK_sat_customer_hub_customer]
GO

----- 2 
ALTER TABLE [dbo].[sat_order]  WITH CHECK ADD  CONSTRAINT [FK_sat_order_hub_order] FOREIGN KEY([hub_order_key])
REFERENCES [dbo].[hub_order] ([hub_order_key])
GO

ALTER TABLE [dbo].[sat_order] CHECK CONSTRAINT [FK_sat_order_hub_order]
GO

---- 3 
ALTER TABLE [dbo].[sat_employee]  WITH CHECK ADD  CONSTRAINT [FK_sat_employee_hub_employee] FOREIGN KEY([hub_employee_key])
REFERENCES [dbo].[hub_employee] ([hub_employee_key])
GO

ALTER TABLE [dbo].[sat_employee] CHECK CONSTRAINT [FK_sat_employee_hub_employee]
GO

---- 4
ALTER TABLE [dbo].[sat_product]  WITH CHECK ADD  CONSTRAINT [FK_sat_product_hub_product] FOREIGN KEY([hub_product_key])
REFERENCES [dbo].[hub_product] ([hub_product_key])
GO

ALTER TABLE [dbo].[sat_product] CHECK CONSTRAINT [FK_sat_product_hub_product]
GO

---- 5 
ALTER TABLE [dbo].[sat_region]  WITH CHECK ADD  CONSTRAINT [FK_sat_region_hub_region] FOREIGN KEY([hub_region_key])
REFERENCES [dbo].[hub_region] ([hub_region_key])
GO

ALTER TABLE [dbo].[sat_region] CHECK CONSTRAINT [FK_sat_region_hub_region]
GO

---- 6 
ALTER TABLE [dbo].[sat_shipper]  WITH CHECK ADD  CONSTRAINT [FK_sat_shipper_hub_shipper] FOREIGN KEY([hub_shipper_key])
REFERENCES [dbo].[hub_shipper] ([hub_shipper_key])
GO

ALTER TABLE [dbo].[sat_shipper] CHECK CONSTRAINT [FK_sat_shipper_hub_shipper]
GO

---- 7
ALTER TABLE [dbo].[sat_supplier]  WITH CHECK ADD  CONSTRAINT [FK_sat_supplier_hub_supplier] FOREIGN KEY([hub_supplier_key])
REFERENCES [dbo].[hub_supplier] ([hub_supplier_key])
GO

ALTER TABLE [dbo].[sat_supplier] CHECK CONSTRAINT [FK_sat_supplier_hub_supplier]
GO

---- 8
ALTER TABLE [dbo].[sat_territory]  WITH CHECK ADD  CONSTRAINT [FK_sat_territory_hub_territory] FOREIGN KEY([hub_territory_key])
REFERENCES [dbo].[hub_territory] ([hub_territory_key])
GO

ALTER TABLE [dbo].[sat_territory] CHECK CONSTRAINT [FK_sat_territory_hub_territory]
GO

---------------------------------------------------------------------------------------------------------------------------

-- link_order_customer

ALTER TABLE [dbo].[link_order_customer]  WITH CHECK ADD  CONSTRAINT [FK_link_order_customer_hub_customer] FOREIGN KEY([hub_customer_key])
REFERENCES [dbo].[hub_customer] ([hub_customer_key])
GO

ALTER TABLE [dbo].[link_order_customer] CHECK CONSTRAINT [FK_link_order_customer_hub_customer]
GO

ALTER TABLE [dbo].[link_order_customer]  WITH CHECK ADD  CONSTRAINT [FK_link_order_customer_hub_order] FOREIGN KEY([hub_order_key])
REFERENCES [dbo].[hub_order] ([hub_order_key])
GO

ALTER TABLE [dbo].[link_order_customer] CHECK CONSTRAINT [FK_link_order_customer_hub_order]
GO

-- 2  link_order_employee

ALTER TABLE [dbo].[link_order_employee]  WITH CHECK ADD  CONSTRAINT [FK_link_order_employee_hub_employee] FOREIGN KEY([hub_employee_key])
REFERENCES [dbo].[hub_employee] ([hub_employee_key])
GO

ALTER TABLE [dbo].[link_order_employee] CHECK CONSTRAINT [FK_link_order_employee_hub_employee]
GO

ALTER TABLE [dbo].[link_order_employee]  WITH CHECK ADD  CONSTRAINT [FK_link_order_employee_hub_order] FOREIGN KEY([hub_order_key])
REFERENCES [dbo].[hub_order] ([hub_order_key])
GO

ALTER TABLE [dbo].[link_order_employee] CHECK CONSTRAINT [FK_link_order_employee_hub_order]
GO


-- 3  link_employee_territory

ALTER TABLE [dbo].[link_employee_territory]  WITH CHECK ADD  CONSTRAINT [FK_link_employee_territory_hub_employee] FOREIGN KEY([hub_employee_key])
REFERENCES [dbo].[hub_employee] ([hub_employee_key])
GO

ALTER TABLE [dbo].[link_employee_territory] CHECK CONSTRAINT [FK_link_employee_territory_hub_employee]
GO

ALTER TABLE [dbo].[link_employee_territory]  WITH CHECK ADD  CONSTRAINT [FK_link_employee_territory_hub_territory] FOREIGN KEY([hub_territory_key])
REFERENCES [dbo].[hub_territory] ([hub_territory_key])
GO

ALTER TABLE [dbo].[link_employee_territory] CHECK CONSTRAINT [FK_link_employee_territory_hub_territory]
GO

-- 4 link_order_product

ALTER TABLE [dbo].[link_order_product]  WITH CHECK ADD  CONSTRAINT [FK_link_order_product_hub_product] FOREIGN KEY([hub_product_key])
REFERENCES [dbo].[hub_product] ([hub_product_key])
GO

ALTER TABLE [dbo].[link_order_product] CHECK CONSTRAINT [FK_link_order_product_hub_product]
GO

ALTER TABLE [dbo].[link_order_product]  WITH CHECK ADD  CONSTRAINT [FK_link_order_product_hub_order] FOREIGN KEY([hub_order_key])
REFERENCES [dbo].[hub_order] ([hub_order_key])
GO

ALTER TABLE [dbo].[link_order_product] CHECK CONSTRAINT [FK_link_order_product_hub_order]
GO

-- 5 link_order_shipper

ALTER TABLE [dbo].[link_order_shipper]  WITH CHECK ADD  CONSTRAINT [FK_link_order_shipper_hub_shipper] FOREIGN KEY([hub_shipper_key])
REFERENCES [dbo].[hub_shipper] ([hub_shipper_key])
GO

ALTER TABLE [dbo].[link_order_shipper] CHECK CONSTRAINT [FK_link_order_shipper_hub_shipper]
GO

ALTER TABLE [dbo].[link_order_shipper]  WITH CHECK ADD  CONSTRAINT [FK_link_order_shipper_hub_order] FOREIGN KEY([hub_order_key])
REFERENCES [dbo].[hub_order] ([hub_order_key])
GO

ALTER TABLE [dbo].[link_order_shipper] CHECK CONSTRAINT [FK_link_order_shipper_hub_order]
GO

-- 6 link_product_supplier

ALTER TABLE [dbo].[link_product_supplier]  WITH CHECK ADD  CONSTRAINT [FK_link_product_supplier_hub_product] FOREIGN KEY([hub_product_key])
REFERENCES [dbo].[hub_product] ([hub_product_key])
GO

ALTER TABLE [dbo].[link_product_supplier] CHECK CONSTRAINT [FK_link_product_supplier_hub_product]
GO

ALTER TABLE [dbo].[link_product_supplier]  WITH CHECK ADD  CONSTRAINT [FK_link_order_product_hub_supplier] FOREIGN KEY([hub_supplier_key])
REFERENCES [dbo].[hub_supplier] ([hub_supplier_key])
GO

ALTER TABLE [dbo].[link_product_supplier] CHECK CONSTRAINT [FK_link_order_product_hub_supplier]
GO

-- 7 link_territory_region
ALTER TABLE [dbo].[link_territory_region]  WITH CHECK ADD  CONSTRAINT [FK_link_territory_region_hub_region] FOREIGN KEY([hub_region_key])
REFERENCES [dbo].[hub_region] ([hub_region_key])
GO

ALTER TABLE [dbo].[link_territory_region] CHECK CONSTRAINT [FK_link_territory_region_hub_region]
GO

ALTER TABLE [dbo].[link_territory_region]  WITH CHECK ADD  CONSTRAINT [FK_link_territory_region_hub_territory] FOREIGN KEY([hub_territory_key])
REFERENCES [dbo].[hub_territory] ([hub_territory_key])
GO

ALTER TABLE [dbo].[link_territory_region] CHECK CONSTRAINT [FK_link_territory_region_hub_territory]
GO

