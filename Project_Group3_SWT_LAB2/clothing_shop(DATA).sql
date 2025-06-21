USE [clothing_shop]
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1, N'TheMoriarty', N'tphong610198@gmail.com', N'$2a$12$CuXL88lRV.caI3o.5ZB/wOM3mUPxEeVp7PnUYC9Tu6iefOfhTlfxO', N'Trần Phong', N'male', N'0123456789', N'uploads/avatars/bb5cb37c-fb96-4a04-a5d6-7bd5732bf5b0.jpg', N'admin', N'active', CAST(N'2025-02-09T16:58:16.1666667' AS DateTime2), CAST(N'2025-02-09T17:12:48.3000000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (2, N'phongthhe186443', N'phongthhe186443@fpt.edu.vn', N'$2a$10$mqTbeXOjwWftYcp3HvgbF.vynnSvUqQfBUY6wj7m7m/tiEnv/YYA6', N'Tran Hoai Phong (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLrSqjCMqEhVL5SMILJ6OOpPyI5S64iKP29HhPEV9aIOgF0i-g=s96-c', N'customer', N'active', CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2), CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (3, N'XiaoXunEr', N'XiaoXunEr@gmail.com', N'$2a$10$sYcqeKA5lzaWHHEHojLoxe378EtZni5873xBA8YfljCthxCADhmoy', N'Tiêu Huân Nhi', N'female', N'0987654321', N'uploads/avatars/huannhi.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (4, N'YaoLao', N'YaoLao@gmail.com', N'$2a$10$XFl8Zk5zSXQo/PjN4df.k.twXuumSIvYM7jLRqVcvx2heTFVyW0Ca', N'Dược Lão', N'male', N'0912345678', N'uploads/avatars/duoclao.jpg', N'marketing', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (5, N'XiaoYan', N'XiaoYan@gmail.com', N'$2a$10$ojVPuuE5ZVLPE/wWOSRFIeNKLkBZh/CZeHE57ij4F.cfKYsdmIxAO', N'Tiêu Viêm', N'male', N'0978123456', N'uploads/avatars/tieuviem.jpg', N'sale', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (6, N'XiaoZhan', N'XiaoZhan@gmail.com', N'$2a$10$7d0sV4kA8mSbQoJhGmROJumQnBeqtpzzMxz7yslGGf5Z1lhx85M7O', N'Tiêu Chiến', N'male', N'0934567890', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (7, N'XiaoDing', N'XiaoDing@gmail.com', N'$2a$10$Yw.YHLgW3IAdZAvicADymOZ4CqopkkbD90.DW7m.0Nz3PxuF/pvsK', N'Tiêu Đỉnh', N'male', N'0956781234', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (8, N'Medusa', N'Medusa@gmail.com', N'$2a$10$7Wjzn5r0OX2pcdowGvA39OBnpNP9.b4MvoaXH4terFmIpSN/htzqa', N'Mỹ Đỗ Toa', N'female', N'0923456789', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (9, N'CaiLin', N'CaiLin@gmail.com', N'$2a$10$de4mBMbt0qfpuKCs0jF1I.wHr5/dfWMYQikSJ8aJqbHyZ8qH2IxXu', N'Thái Lan', N'female', N'0965432109', N'uploads/avatars/default.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (10, N'HaiBoDong', N'HaiBoDong@gmail.com', N'$2a$10$5l/p6PdL8crcmH0qAcniEuQGjrlNc1GYrSWKcYVeloYoxtqhczhOe', N'Hải Ba Đông', N'male', N'0998765432', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (11, N'NalanYanran', N'NalanYanran@gmail.com', N'$2a$10$.Aa9sv.fZvHA4HIS6vcfNuSGM.zlr3ldxMuo8FccCVDGIgjaYP8pq', N'Nalan Yên Nhiên', N'female', N'0943216789', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (12, N'GuYuan', N'GuYuan@gmail.com', N'$2a$10$JaWF8M.AaFAxaCcq7e2zK.TLravMOCQvxG3NXAAoKlDMVnL/PVzq6', N'Cổ Nguyên', N'male', N'0981234567', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (13, N'GuXun', N'GuXun@gmail.com', N'$2a$10$s.runNoG/32WCxknTJrbs.6oqxowlmPDAqgFdvEgs7xcOOYyrEbQW', N'Cổ Xán', N'male', N'0976543210', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (14, N'YunShan', N'YunShan@gmail.com', N'$2a$10$tdQRtCI1.aPdt.qbe2ee.eOrC2Tq2XQymcNE9z9.6GChMVWVRHGYy', N'Vân Sơn', N'male', N'0919876543', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (15, N'FaMa', N'FaMa@gmail.com', N'$2a$10$T7bONEjEQCimeWWQGFDPzuhsN10hiSSbQFFugWa.MUOA93XyLYWTu', N'Pháp Mã', N'male', N'0921987654', N'uploads/avatars/default.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (16, N'HuJia', N'HuJia@gmail.com', N'$2a$10$3iPVuYw6ScoAZULHkjrkyOcMSbMzVWMiQH35Pnw.de1rnGNjxN2ku', N'Hồ Gia', N'female', N'0932198765', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (17, N'LingYing', N'LingYing@gmail.com', N'$2a$10$/wuejts3V40G0e/NGB/pOuM5ciGBGTL.fPPNoMDOvb.NVdQmgIjU.', N'Lăng Ảnh', N'male', N'0954321987', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (18, N'YanXiao', N'YanXiao@gmail.com', N'$2a$10$7QRPlkWt96Ah6r.5Frgiku3/QCZpAwMDPyLuvurl61Uqij.fqJbTC', N'Diệp Hiên', N'male', N'0965432198', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (19, N'QingLin', N'QingLin@gmail.com', N'$2a$10$5UThIZ.2xCuTFxaq3Xtd4OQUDPPQLhsWWlbrWXJydo574exxXviKO', N'Thanh Lân', N'female', N'0976543219', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (20, N'XiaoLei', N'XiaoLei@gmail.com', N'$2a$10$WIhlpSF/rOFJ06PxhnhQ7OLriyxm2rkxRKyq2ThvpkRtKQTlzDPcS', N'Tiêu Lôi', N'male', N'0987654329', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (21, N'FengLei', N'FengLei@gmail.com', N'$2a$10$f68ZbQbQru4.i8erDSO4quX27/d/Czq0jRBJXCbOmsHH/zE80tD8.', N'Phong Lôi', N'male', N'0998765431', N'uploads/avatars/default.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (22, N'ZiYan', N'ZiYan@gmail.com', N'$2a$10$ky5Lacc8ObH4QwmJ8LGeauTWFq5CT2/cxQhM98ug/lSH4xGYU.J7i', N'Tử Nghiên', N'female', N'0909876543', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (1, 1, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (2, 2, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (3, 3, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (1, N'Quần áo nam', N'Các loại quần áo cho nam', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (2, N'Quần áo nữ', N'Các loại quần áo cho nữ', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (3, N'Quần áo trẻ em', N'Quần áo cho trẻ em', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (4, N'Phụ kiện', N'Các phụ kiện thời trang', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (5, N'Giày dép', N'Các loại giày dép', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (6, N'Áo nam', N'Các loại áo cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (7, N'Quần nam', N'Các loại quần cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (8, N'Áo nữ', N'Các loại áo cho nữ', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (9, N'Váy & Chân váy', N'Các loại váy và chân váy', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (10, N'Quần jean nam', N'Quần jean các loại', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (11, N'Quần kaki nam', N'Quần kaki lịch lãm', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (12, N'Áo sơ mi nam', N'Áo sơ mi công sở', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (13, N'Áo thun nam', N'Áo thun cotton', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (14, N'Đầm dự tiệc', N'Đầm dài, đầm body', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (15, N'Áo sơ mi nữ', N'Áo sơ mi công sở', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (16, N'Áo thun nữ', N'Áo thun cotton', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (17, N'Váy maxi', N'Váy maxi dài', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (18, N'Giày thể thao', N'Các loại giày thể thao', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (19, N'Giày da', N'Các loại giày da', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (20, N'Sandal', N'Các loại sandal', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (21, N'Túi xách nữ', N'Các loại túi xách cho nữ', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (22, N'Túi xách nam', N'Các loại túi xách cho nam', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (23, N'Thắt lưng nam', N'Thắt lưng cho nam', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (24, N'Thắt lưng nữ', N'Thắt lưng cho nữ', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (25, N'Áo khoác nam', N'Áo khoác dù, bomber', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (26, N'Áo khoác nữ', N'Áo khoác dù, bomber', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (27, N'Quần short nam', N'Quần short kaki, jean', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (28, N'Quần short nữ', N'Quần short kaki, jean', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (29, N'Giày Sneaker Nam', N'Giày Sneaker Nam', 18, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (30, N'Giày Sneaker Nữ', N'Giày Sneaker Nữ', 18, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (31, N'Giày Tây Nam', N'Giày Tây Nam', 19, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (32, N'Giày Cao Gót', N'Giày Cao Gót', 19, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (33, N'Sandal Nam', N'Sandal Nam', 20, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (34, N'Sandal Nữ', N'Sandal Nữ', 20, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (35, N'Túi đeo chéo nam', N'Túi đeo chéo nam', 22, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (36, N'Túi xách tay nữ', N'Túi xách tay nữ', 21, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (37, N'Đồ bộ nam', N'Các loại đồ bộ cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (38, N'Đồ bộ nữ', N'Các loại đồ bộ cho nữ', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (39, N'Áo trẻ em', N'Các loại áo cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (40, N'Quần trẻ em', N'Các loại quần cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (41, N'Váy trẻ em', N'Các loại váy cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (42, N'Kính mắt', N'Các loại kính thời trang', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (43, N'Trang sức', N'Các loại trang sức', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (44, N'Dép', N'Các loại dép', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (45, N'Áo vest nam', N'Áo vest lịch lãm', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (46, N'Quần tây nam', N'Quần tây công sở', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (47, N'Đồ bộ thể thao nam', N'Đồ bộ thể thao nam', 37, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (48, N'Đồ bộ mặc nhà nam', N'Đồ bộ mặc nhà nam', 37, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (49, N'Áo kiểu nữ', N'Áo kiểu thời trang', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (50, N'Chân váy', N'Chân váy các loại', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (51, N'Đồ bộ thể thao nữ', N'Đồ bộ thể thao nữ', 38, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (52, N'Đồ bộ mặc nhà nữ', N'Đồ bộ mặc nhà nữ', 38, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (53, N'Áo thun trẻ em', N'Áo thun trẻ em', 39, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (54, N'Áo sơ mi trẻ em', N'Áo sơ mi trẻ em', 39, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (55, N'Quần jean trẻ em', N'Quần jean trẻ em', 40, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (56, N'Quần short trẻ em', N'Quần short trẻ em', 40, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (57, N'Váy xòe trẻ em', N'Váy xòe trẻ em', 41, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (58, N'Đầm công chúa trẻ em', N'Đầm công chúa trẻ em', 41, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (59, N'Túi đeo chéo nữ', N'Túi đeo chéo nữ', 21, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (60, N'Balo nam', N'Balo nam', 22, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (61, N'Thắt lưng da nam', N'Thắt lưng da nam', 23, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (62, N'Thắt lưng vải nam', N'Thắt lưng vải nam', 23, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (63, N'Thắt lưng da nữ', N'Thắt lưng da nữ', 24, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (64, N'Thắt lưng vải nữ', N'Thắt lưng vải nữ', 24, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (65, N'Kính râm', N'Kính râm', 42, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (66, N'Kính cận', N'Kính cận', 42, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (67, N'Dây chuyền', N'Dây chuyền', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (68, N'Bông tai', N'Bông tai', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (69, N'Nhẫn', N'Nhẫn', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (70, N'Dép lào nam', N'Dép lào nam', 44, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (71, N'Dép quai ngang nữ', N'Dép quai ngang nữ', 44, 3, N'active')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (1, N'Áo sơ mi trắng', 12, N'Áo sơ mi trắng phong cách, phù hợp với mọi dịp', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/500333436/product/tx_03696_da789ffaa68d42d3b2ad129b099e15ae_master.jpg', N'active', 1, N'1', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (2, N'Quần tây đen', 46, N'Quần tây màu đen lịch lãm, phù hợp cho công sở', CAST(280000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/200000053174/product/20_bddc67b2b01a4fc6a89b6d5ca1e78b33_master.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (3, N'Đầm hoa mùa hè', 14, N'Đầm hoa nhẹ nhàng, thoải mái, phù hợp cho mùa hè', CAST(350000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), N'https://file.hstatic.net/200000503583/file/vay-hoa-mua-he__11__c2791afbbda941238c114b00b403ec57.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (4, N'Chân váy denim', 50, N'Chân váy denim thời trang, dễ phối đồ', CAST(220000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luaj8uf2in1bf1', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (5, N'Áo thun siêu nhân', 53, N'Áo thun với họa tiết siêu nhân, dành cho trẻ em', CAST(120000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://target.scene7.com/is/image/Target/GUEST_1079d260-d8e2-4d6e-b757-7dd7254ddda5?wid=800&hei=800&qlt=80&fmt=webp', N'active', 1, N'2', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (6, N'Quần short cotton', 56, N'Quần short cotton mềm mại, thoáng mát', CAST(50000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'https://ardilla.com.vn/wp-content/uploads/2022/03/TB1601QST.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (7, N'Thắt lưng da', 61, N'Thắt lưng da cao cấp, bền đẹp theo thời gian', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://authenticvietnam.vn/wp-content/uploads/that-lung-da-gucci-nam-406831DJ20T_2145_001_100_0000_Light-Leather-belt-with-Double-G-buckle.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (9, N'Giày thể thao', 29, N'Giày thể thao nhẹ nhàng, phù hợp cho cả nam và nữ', CAST(450000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/22/z5855779313414_2914371405362ca7f474791328971969.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (10, N'Giày sneaker', 30, N'Giày sneaker thời trang, phù hợp cho đi chơi', CAST(350000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/thumb/large/100/041/044/products/48f5343d-9f9a-4ed2-aa02-de2ad1f4fabc-jpeg.jpg?v=1694597357733', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (11, N'Quần short siêu nhân', 56, N'Quần short với họa tiết siêu nhân, dành cho trẻ em', CAST(480000.00 AS Decimal(10, 2)), CAST(550000.00 AS Decimal(10, 2)), N'https://img.alicdn.com/imgextra/i3/350427093/O1CN01JDrMyz22GdnbaZ9Y6_!!350427093.jpg_600x600.jpg_.webp', N'active', 0, N'2', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (12, N'Áo so mi xanh', 12, N'Áo sơ mi xanh phong cách, phù hợp với mọi dịp', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://pos.nvncdn.com/a36e05-151378/ps/20230712_TkKQqMtkUO.jpeg', N'active', 0, N'1', CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2), CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (13, N'Áo khoác bomber nam', 25, N'Áo khoác bomber phong cách thể thao, chống gió tốt', CAST(399000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), N'https://ginstore.com.vn/files/sanpham/1885/1/png/ao-khoac-bomber-local-brand-rg-butterfly-varsity-jacket-nam-nu-tay-da-vasity-bong-chay-form-rong-unisex.png', N'active', 0, NULL, CAST(N'2025-02-24T10:15:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (14, N'Quần jogger thể thao', 27, N'Quần jogger co giãn, thoải mái khi vận động', CAST(199000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://thegioidotap.vn/wp-content/uploads/2020/12/quan-dai-the-thao-nam-jogger-sg10-3.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:20:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (15, N'Đầm maxi hoa nhí', 17, N'Đầm maxi dài họa tiết hoa nhí, phong cách boho', CAST(375000.00 AS Decimal(10, 2)), CAST(420000.00 AS Decimal(10, 2)), N'https://vayfashion.com/wp-content/uploads/2022/05/2c7cf97edbac2d98f120bf85c824f1aa.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:25:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:25:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (16, N'Áo thun unisex', 16, N'Áo thun form rộng, unisex, phong cách đường phố', CAST(150000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'https://sure.vn/wp-content/uploads/2024/08/7-1-scaled.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:30:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (17, N'Váy công chúa cho bé gái', 58, N'Váy công chúa lấp lánh cho bé gái, phù hợp dự tiệc', CAST(289000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)), N'https://tutupetti.com/wp-content/uploads/2023/07/dam_dep_cho_be_du_tiec_04.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:35:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:35:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (18, N'Balo nam thời trang', 60, N'Balo nam chống nước, nhiều ngăn, phù hợp đi học, đi làm', CAST(299000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/sg-11134201-22120-qz5c8pq2mlkv95', N'active', 0, NULL, CAST(N'2025-02-24T10:40:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:40:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (19, N'Dây chuyền bạc nữ', 67, N'Dây chuyền bạc 925 thiết kế tinh tế, sang trọng', CAST(225000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://pos.nvncdn.com/211f76-106986/ps/20240805_RdCu2zj3rc.jpeg', N'active', 0, NULL, CAST(N'2025-02-24T10:45:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (20, N'Giày cao gót nữ', 32, N'Giày cao gót 7cm, mũi nhọn, phù hợp công sở', CAST(330000.00 AS Decimal(10, 2)), CAST(380000.00 AS Decimal(10, 2)), N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/20/z5850479583248_27cb755c82bd913bc95a09019f771777.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:50:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:50:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (21, N'Kính mát thời trang', 65, N'Kính mát chống tia UV, gọng kim loại sành điệu', CAST(175000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://hoyahc.vn/wp-content/uploads/2022/01/kinh-redex-kinh-mat.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:55:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:55:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (22, N'Áo sơ mi nam kẻ sọc', 12, N'Áo sơ mi nam kẻ sọc, chất vải cotton thoáng mát', CAST(245000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'https://aoxuanhe.com/upload/product/axh-111/ao-so-mi-nam-ke-soc-xanh-duong-1.jpg', N'active', 0, NULL, CAST(N'2025-02-24T11:00:00.0000000' AS DateTime2), CAST(N'2025-02-24T11:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (23, N'Quần jean skinny nữ', 28, N'Quần jean skinny co giãn cao, ôm sát tôn dáng', CAST(279000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/100/386/478/products/b51045-xanhdam4-1695718398227.jpg?v=1695718423327', N'active', 0, NULL, CAST(N'2025-02-25T10:00:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (24, N'Áo len oversize unisex', 13, N'Áo len dệt kim dày dặn, kiểu dáng rộng rãi phong cách Hàn Quốc', CAST(299000.00 AS Decimal(10, 2)), CAST(360000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/200000923713/product/upload_1b135183cd3f4e1da78e48ce8e4404bd_master.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:05:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:05:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (25, N'Túi đeo chéo nữ mini', 59, N'Túi đeo chéo nữ kiểu dáng nhỏ gọn, nhiều ngăn tiện lợi', CAST(25000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://image.kacana.vn/images/product/tui-cheo-dung-dien-thoai-va-tien-you-2811-1720436440.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:10:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:10:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (26, N'Bông tai bạc hình giọt nước', 68, N'Bông tai nữ bạc 925 thiết kế tinh tế hình giọt nước', CAST(129000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://lili.vn/wp-content/uploads/2021/12/Bong-tai-bac-nu-ma-bach-kim-dinh-da-CZ-hinh-giot-nuoc-LILI_416496_13.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:15:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (27, N'Áo khoác nữ cardigan', 26, N'Áo khoác cardigan dệt kim mỏng nhẹ, kiểu dáng basic', CAST(265000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/thumb/1024x1024/100/119/564/products/ao-khoac-nu-han-quoc-4476.jpg?v=1726800949063', N'active', 0, NULL, CAST(N'2025-02-25T10:20:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (28, N'Dép lào nam cao cấp', 70, N'Dép lào nam chất liệu cao su bền bỉ, đế chống trượt', CAST(155000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'https://cf.shopee.vn/file/c6d1c6eb69fc0f5b382006d61baf5856', N'active', 0, NULL, CAST(N'2025-02-25T10:25:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:25:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (29, N'Áo thun trẻ em hoạt hình', 53, N'Áo thun cotton in họa tiết hoạt hình dễ thương cho bé', CAST(120000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/500387570/product/ao_sieu_nhan_dai_tay_be_trai_xanh_1_29b6db9d6dab4e649d6d1528a1cef68d_master.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:30:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (30, N'Nhẫn bạc đính đá zircon', 69, N'Nhẫn bạc 925 đính đá zircon sang trọng', CAST(199000.00 AS Decimal(10, 2)), CAST(230000.00 AS Decimal(10, 2)), N'https://lili.vn/wp-content/uploads/2021/08/Nhan-bac-dinh-da-Zircon-Royal-LILI_499436_2.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:35:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:35:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (31, N'Chân váy xếp ly dáng ngắn', 50, N'Chân váy xếp ly dáng tennis, phong cách Hàn Quốc', CAST(245000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/55791d774c509649738b1bb8aba06a7d', N'active', 0, NULL, CAST(N'2025-02-25T10:40:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:40:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (32, N'Quần kaki nam', 11, N'Quần kaki nam dáng suông basic, chất vải cao cấp', CAST(299000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'https://vulcano.sgp1.digitaloceanspaces.com/media/18894/quan-khaki-3001t-vulcano01.webp', N'active', 0, NULL, CAST(N'2025-02-25T10:45:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:45:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[product_sizes] ON 
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (1, 1, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (2, 1, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (3, 1, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (4, 1, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (5, 2, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (6, 2, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (7, 2, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (8, 2, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (9, 3, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (10, 3, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (11, 3, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (12, 4, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (13, 4, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (14, 4, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (15, 5, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (16, 5, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (17, 5, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (18, 6, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (19, 6, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (20, 6, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (21, 11, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (22, 11, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (23, 11, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (24, 7, N'90cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (25, 7, N'100cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (26, 7, N'110cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (28, 9, N'38')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (29, 9, N'39')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (30, 9, N'40')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (31, 9, N'41')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (32, 9, N'42')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (33, 10, N'38')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (34, 10, N'39')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (35, 10, N'40')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (36, 10, N'41')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (37, 10, N'42')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (38, 12, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (39, 12, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (40, 12, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (41, 12, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (42, 13, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (43, 13, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (44, 13, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (45, 13, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (46, 14, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (47, 14, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (48, 14, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (49, 14, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (50, 15, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (51, 15, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (52, 15, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (53, 16, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (54, 16, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (55, 16, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (56, 16, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (57, 17, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (58, 17, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (59, 17, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (60, 18, N'Onesize')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (61, 19, N'40cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (62, 19, N'45cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (63, 19, N'50cm')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (64, 20, N'35')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (65, 20, N'36')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (66, 20, N'37')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (67, 20, N'38')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (68, 20, N'39')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (69, 21, N'Onesize')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (70, 22, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (71, 22, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (72, 22, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (73, 22, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (74, 23, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (75, 23, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (76, 23, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (77, 23, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (78, 24, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (79, 24, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (80, 24, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (81, 24, N'XL')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (82, 25, N'Onesize')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (83, 26, N'Onesize')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (84, 27, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (85, 27, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (86, 27, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (87, 28, N'39')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (88, 28, N'40')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (89, 28, N'41')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (90, 28, N'42')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (91, 28, N'43')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (92, 29, N'2-4')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (93, 29, N'4-6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (94, 29, N'6-8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (95, 29, N'8-10')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (96, 30, N'5')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (97, 30, N'6')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (98, 30, N'7')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (99, 30, N'8')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (100, 31, N'S')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (101, 31, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (102, 31, N'L')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (103, 32, N'28')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (104, 32, N'30')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (105, 32, N'32')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (106, 32, N'34')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (107, 32, N'36')
GO
SET IDENTITY_INSERT [dbo].[product_sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[product_colors] ON 
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (1, 1, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (2, 1, N'Xanh nhạt')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (3, 2, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (4, 2, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (5, 3, N'Hoa xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (6, 3, N'Hoa đỏ')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (7, 4, N'Xanh đậm')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (8, 4, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (9, 5, N'Đỏ')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (10, 5, N'Xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (11, 6, N'Xanh navy')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (12, 6, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (13, 7, N'Nâu')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (14, 7, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (17, 9, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (18, 9, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (19, 10, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (20, 10, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (21, 10, N'Xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (22, 11, N'Xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (23, 11, N'Đỏ')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (24, 12, N'Xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (25, 12, N'Xanh đậm')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (26, 13, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (27, 13, N'Navy')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (29, 14, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (30, 14, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (31, 14, N'Xanh đậm')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (32, 15, N'Trắng họa tiết hoa xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (33, 15, N'Hồng họa tiết hoa trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (34, 16, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (35, 16, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (36, 16, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (37, 17, N'Hồng pastel')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (38, 17, N'Tím lavender')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (39, 18, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (40, 18, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (41, 18, N'Xanh navy')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (42, 19, N'Bạc')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (43, 19, N'Vàng hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (44, 20, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (45, 20, N'Kem')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (46, 20, N'Đỏ đô')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (47, 21, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (48, 21, N'Nâu')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (49, 21, N'Vàng gold')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (50, 22, N'Trắng sọc xanh')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (51, 22, N'Trắng sọc đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (52, 22, N'Xanh nhạt sọc trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (53, 23, N'Xanh đậm')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (54, 23, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (55, 23, N'Xanh nhạt')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (56, 24, N'Kem')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (57, 24, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (58, 24, N'Nâu')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (59, 25, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (60, 25, N'Hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (61, 25, N'Kem')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (62, 26, N'Bạc')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (63, 26, N'Vàng hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (64, 27, N'Kem')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (65, 27, N'Xanh mint')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (66, 27, N'Hồng nhạt')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (67, 28, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (68, 28, N'Nâu')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (69, 29, N'Trắng họa tiết')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (70, 29, N'Xanh da trời họa tiết')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (71, 29, N'Vàng họa tiết')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (72, 30, N'Bạc')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (73, 30, N'Vàng hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (74, 31, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (75, 31, N'Xám')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (76, 31, N'Kẻ caro')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (77, 32, N'Be')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (78, 32, N'Xanh navy')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (79, 32, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (80, 32, N'Hồng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (81, 32, N'Đỏ')
GO
SET IDENTITY_INSERT [dbo].[product_colors] OFF
GO
SET IDENTITY_INSERT [dbo].[product_variants] ON 
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (1, 1, N'ASMT1-TRANG-S', 1, 1, 50, CAST(N'2025-03-01T05:32:49.6166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (2, 1, N'ASMT1-TRANG-M', 2, 1, 75, CAST(N'2025-03-01T05:32:46.1733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (3, 1, N'ASMT1-TRANG-L', 3, 1, 60, CAST(N'2025-03-01T05:32:44.3233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (4, 1, N'ASMT1-TRANG-XL', 4, 1, 40, CAST(N'2025-03-01T05:32:47.8333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (5, 1, N'ASMT1-XANHN-S', 1, 2, 45, CAST(N'2025-03-01T05:32:56.7500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (6, 1, N'ASMT1-XANHN-M', 2, 2, 70, CAST(N'2025-03-01T05:32:53.2233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (7, 1, N'ASMT1-XANHN-L', 3, 2, 55, CAST(N'2025-03-01T05:32:51.3033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (8, 1, N'ASMT1-XANHN-XL', 4, 2, 35, CAST(N'2025-03-01T05:32:54.7833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (9, 2, N'QTD2-DEN-S', 5, 3, 40, CAST(N'2025-03-01T05:33:56.5733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (10, 2, N'QTD2-DEN-M', 6, 3, 65, CAST(N'2025-03-01T05:33:54.9400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (11, 2, N'QTD2-DEN-L', 7, 3, 50, CAST(N'2025-03-01T05:33:52.9966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (12, 2, N'QTD2-DEN-XL', 8, 3, 30, CAST(N'2025-03-01T05:33:58.3033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (13, 2, N'QTD2-XAM-S', 5, 4, 35, CAST(N'2025-03-01T05:34:03.8566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (14, 2, N'QTD2-XAM-M', 6, 4, 60, CAST(N'2025-03-01T05:34:02.0033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (15, 2, N'QTD2-XAM-L', 7, 4, 45, CAST(N'2025-03-01T05:34:00.2000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (16, 2, N'QTD2-XAM-XL', 8, 4, 25, CAST(N'2025-03-01T05:34:15.2900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (17, 3, N'DHMH3-HOAX-S', 9, 5, 30, CAST(N'2025-03-01T05:37:04.1966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (18, 3, N'DHMH3-HOAX-M', 10, 5, 45, CAST(N'2025-03-01T05:37:02.6533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (19, 3, N'DHMH3-HOAX-L', 11, 5, 20, CAST(N'2025-03-01T05:37:01.500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (20, 3, N'DHMH3-HOAD-S', 9, 6, 25, CAST(N'2025-03-01T05:36:59.4766667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (21, 3, N'DHMH3-HOAD-M', 10, 6, 40, CAST(N'2025-03-01T05:36:56.950000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (22, 3, N'DHMH3-HOAD-L', 11, 6, 15, CAST(N'2025-03-01T05:36:55.2233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (23, 4, N'CVD4-XANHD-S', 12, 7, 35, CAST(N'2025-03-01T05:33:28.4200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (24, 4, N'CVD4-XANHD-M', 13, 7, 50, CAST(N'2025-03-01T05:33:26.4733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (25, 4, N'CVD4-XANHD-L', 14, 7, 25, CAST(N'2025-03-01T05:33:24.7666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (26, 4, N'CVD4-DEN-S', 12, 8, 30, CAST(N'2025-03-01T05:33:23.1033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (27, 4, N'CVD4-DEN-M', 13, 8, 45, CAST(N'2025-03-01T05:33:21.2866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (28, 4, N'CVD4-DEN-L', 14, 8, 20, CAST(N'2025-03-01T05:33:19.7200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (29, 5, N'ATSN5-DO-2-4', 15, 9, 60, CAST(N'2025-03-01T05:33:02.6033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (30, 5, N'ATSN5-DO-4-6', 16, 9, 75, CAST(N'2025-03-01T05:33:04.3900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (31, 5, N'ATSN5-DO-6-8', 17, 9, 50, CAST(N'2025-03-01T05:33:08.3566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (32, 5, N'ATSN5-XANH-2-4', 15, 10, 55, CAST(N'2025-03-01T05:33:06.7300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (33, 5, N'ATSN5-XANH-4-6', 16, 10, 70, CAST(N'2025-03-01T05:33:09.9700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (34, 5, N'ATSN5-XANH-6-8', 17, 10, 45, CAST(N'2025-03-01T05:33:12.7200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (35, 6, N'QSC6-XANHN-2-4', 18, 11, 65, CAST(N'2025-03-01T05:34:24.9300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (36, 6, N'QSC6-XANHN-4-6', 19, 11, 80, CAST(N'2025-03-01T05:34:23.2400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (37, 6, N'QSC6-XANHN-6-8', 20, 11, 55, CAST(N'2025-03-01T05:34:21.4366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (38, 6, N'QSC6-XAM-2-4', 18, 12, 60, CAST(N'2025-03-01T05:34:30.2333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (39, 6, N'QSC6-XAM-4-6', 19, 12, 75, CAST(N'2025-03-01T05:34:28.4800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (40, 6, N'QSC6-XAM-6-8', 20, 12, 50, CAST(N'2025-03-01T05:34:26.6366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (41, 7, N'TLD7-NAU-90CM', 24, 13, 40, CAST(N'2025-03-01T05:34:46.2300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (42, 7, N'TLD7-NAU-100CM', 25, 13, 50, CAST(N'2025-03-01T05:34:44.6233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (43, 7, N'TLD7-NAU-110CM', 26, 13, 30, CAST(N'2025-03-01T05:34:43.1500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (44, 7, N'TLD7-DEN-90CM', 24, 14, 35, CAST(N'2025-03-01T05:34:41.5633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (45, 7, N'TLD7-DEN-100CM', 25, 14, 45, CAST(N'2025-03-01T05:34:38.2533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (46, 7, N'TLD7-DEN-110CM', 26, 14, 25, CAST(N'2025-03-01T05:34:40.0266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (49, 9, N'GTT9-TRANG-38', 28, 17, 25, CAST(N'2025-03-01T05:35:49.7300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (50, 9, N'GTT9-TRANG-39', 29, 17, 35, CAST(N'2025-03-01T05:35:45.2166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (51, 9, N'GTT9-TRANG-40', 30, 17, 40, CAST(N'2025-03-01T05:35:52.1066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (52, 9, N'GTT9-TRANG-41', 31, 17, 30, CAST(N'2025-03-01T05:35:57.1700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (53, 9, N'GTT9-TRANG-42', 32, 17, 20, CAST(N'2025-03-01T05:35:54.7366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (54, 9, N'GTT9-DEN-38', 28, 18, 20, CAST(N'2025-03-01T05:35:36.2066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (55, 9, N'GTT9-DEN-39', 29, 18, 30, CAST(N'2025-03-01T05:35:39.6033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (56, 9, N'GTT9-DEN-40', 30, 18, 35, CAST(N'2025-03-01T05:35:37.9700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (57, 9, N'GTT9-DEN-41', 31, 18, 25, CAST(N'2025-03-01T05:35:41.3400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (58, 9, N'GTT9-DEN-42', 32, 18, 15, CAST(N'2025-03-01T05:35:47.2166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (59, 10, N'GS10-TRANG-38', 33, 19, 30, CAST(N'2025-03-01T05:34:59.9733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (60, 10, N'GS10-TRANG-39', 34, 19, 40, CAST(N'2025-03-01T05:35:03.4600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (61, 10, N'GS10-TRANG-40', 35, 19, 50, CAST(N'2025-03-01T05:35:05.2566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (62, 10, N'GS10-TRANG-41', 36, 19, 35, CAST(N'2025-03-01T05:35:06.9266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (63, 10, N'GS10-TRANG-42', 37, 19, 25, CAST(N'2025-03-01T05:35:09.0933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (64, 10, N'GS10-DEN-38', 33, 20, 20, CAST(N'2025-03-01T05:34:53.1966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (65, 10, N'GS10-DEN-39', 34, 20, 30, CAST(N'2025-03-01T05:34:55.0733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (66, 10, N'GS10-DEN-40', 35, 20, 45, CAST(N'2025-03-01T05:34:56.6600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (67, 10, N'GS10-DEN-41', 36, 20, 40, CAST(N'2025-03-01T05:34:58.1466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (68, 10, N'GS10-DEN-42', 37, 20, 30, CAST(N'2025-03-01T05:35:01.5366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (69, 10, N'GS10-XANH-38', 33, 21, 25, CAST(N'2025-03-01T05:35:11.7233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (70, 10, N'GS10-XANH-39', 34, 21, 35, CAST(N'2025-03-01T05:35:17.1533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (71, 10, N'GS10-XANH-40', 35, 21, 50, CAST(N'2025-03-01T05:35:20.3666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (72, 10, N'GS10-XANH-41', 36, 21, 45, CAST(N'2025-03-01T05:35:23.5666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (73, 10, N'GS10-XANH-42', 37, 21, 30, CAST(N'2025-03-01T05:35:14.4900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (74, 11, N'QSSN11-XANH-2-4', 21, 22, 55, CAST(N'2025-03-01T05:37:41.0600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (75, 11, N'QSSN11-XANH-4-6', 22, 22, 65, CAST(N'2025-03-01T05:37:42.5333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (76, 11, N'QSSN11-XANH-6-8', 23, 22, 50, CAST(N'2025-03-01T05:37:44.3800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (77, 11, N'QSSN11-DO-2-4', 21, 23, 45, CAST(N'2025-03-01T05:37:36.0500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (78, 11, N'QSSN11-DO-4-6', 22, 23, 60, CAST(N'2025-03-01T05:37:37.9966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (79, 11, N'QSSN11-DO-6-8', 23, 23, 55, CAST(N'2025-03-01T05:37:39.5366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (80, 12, N'ASMX12-XANH-S', 38, 24, 40, CAST(N'2025-03-01T05:32:29.2166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (81, 12, N'ASMX12-XANH-M', 39, 24, 55, CAST(N'2025-03-01T05:32:26.0466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (82, 12, N'ASMX12-XANH-L', 40, 24, 35, CAST(N'2025-03-01T05:32:24.5433333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (83, 12, N'ASMX12-XANH-XL', 41, 24, 50, CAST(N'2025-03-01T05:32:32.7566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (84, 12, N'ASMX12-XANHD-S', 38, 25, 45, CAST(N'2025-03-01T05:32:38.050000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (85, 12, N'ASMX12-XANHD-M', 39, 25, 60, CAST(N'2025-03-01T05:32:30.8466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (86, 12, N'ASMX12-XANHD-L', 40, 25, 30, CAST(N'2025-03-01T05:32:34.5133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (87, 12, N'ASMX12-XANHD-XL', 41, 25, 55, CAST(N'2025-03-01T05:32:36.2933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (88, 13, N'AKBN13-DEN-S', 42, 26, 40, CAST(N'2025-03-01T05:30:59.8700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (89, 13, N'AKBN13-DEN-M', 43, 26, 60, CAST(N'2025-03-01T05:30:55.6000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (90, 13, N'AKBN13-DEN-L', 44, 26, 50, CAST(N'2025-03-01T05:30:53.9466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (91, 13, N'AKBN13-DEN-XL', 45, 26, 30, CAST(N'2025-03-01T05:30:57.5000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (92, 13, N'AKBN13-NAVY-S', 42, 27, 35, CAST(N'2025-03-01T05:31:05.5466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (93, 13, N'AKBN13-NAVY-M', 43, 27, 55, CAST(N'2025-03-01T05:31:03.5166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (94, 13, N'AKBN13-NAVY-L', 44, 27, 45, CAST(N'2025-03-01T05:31:01.7566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (95, 13, N'AKBN13-NAVY-XL', 45, 27, 25, CAST(N'2025-03-01T05:31:08.3633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (100, 14, N'QJTT14-DEN-S', 46, 29, 45, CAST(N'2025-03-01T05:31:37.6933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (101, 14, N'QJTT14-DEN-M', 47, 29, 65, CAST(N'2025-03-01T05:31:34.0066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (102, 14, N'QJTT14-DEN-L', 48, 29, 55, CAST(N'2025-03-01T05:31:31.0666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (103, 14, N'QJTT14-DEN-XL', 49, 29, 35, CAST(N'2025-03-01T05:31:35.6833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (104, 14, N'QJTT14-XAM-S', 46, 30, 40, CAST(N'2025-03-01T05:31:44.9633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (105, 14, N'QJTT14-XAM-M', 47, 30, 60, CAST(N'2025-03-01T05:31:42.9900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (106, 14, N'QJTT14-XAM-L', 48, 30, 50, CAST(N'2025-03-01T05:31:40.2200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (107, 14, N'QJTT14-XAM-XL', 49, 30, 30, CAST(N'2025-03-01T05:31:46.7166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (108, 14, N'QJTT14-XANHD-S', 46, 31, 35, CAST(N'2025-03-01T05:31:55.0566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (109, 14, N'QJTT14-XANHD-M', 47, 31, 55, CAST(N'2025-03-01T05:31:51.9633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (110, 14, N'QJTT14-XANHD-L', 48, 31, 45, CAST(N'2025-03-01T05:31:49.3600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (111, 14, N'QJTT14-XANHD-XL', 49, 31, 25, CAST(N'2025-03-01T05:31:57.5966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (112, 15, N'DMHN15-TRANGHTHX-S', 50, 32, 30, CAST(N'2025-03-01T05:32:14.0900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (113, 15, N'DMHN15-TRANGHTHX-M', 51, 32, 45, CAST(N'2025-03-01T05:32:10.7633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (114, 15, N'DMHN15-TRANGHTHX-L', 52, 32, 25, CAST(N'2025-03-01T05:32:12.450000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (115, 15, N'DMHN15-HONGHTHT-S', 50, 33, 35, CAST(N'2025-03-01T05:32:08.9366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (116, 15, N'DMHN15-HONGHTHT-M', 51, 33, 50, CAST(N'2025-03-01T05:32:06.5033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (117, 15, N'DMHN15-HONGHTHT-L', 52, 33, 30, CAST(N'2025-03-01T05:32:04.3800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (118, 16, N'ATU16-TRANG-S', 53, 34, 50, CAST(N'2025-03-01T05:30:33.9566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (119, 16, N'ATU16-TRANG-M', 54, 34, 70, CAST(N'2025-03-01T05:30:24.7866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (120, 16, N'ATU16-TRANG-L', 55, 34, 60, CAST(N'2025-03-01T05:30:31.8500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (121, 16, N'ATU16-TRANG-XL', 56, 34, 40, CAST(N'2025-03-01T05:30:36.4300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (122, 16, N'ATU16-DEN-S', 53, 35, 55, CAST(N'2025-03-01T05:30:27.0500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (123, 16, N'ATU16-DEN-M', 54, 35, 75, CAST(N'2025-03-01T05:30:22.6733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (124, 16, N'ATU16-DEN-L', 55, 35, 65, CAST(N'2025-03-01T05:30:17.3166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (125, 16, N'ATU16-DEN-XL', 56, 35, 45, CAST(N'2025-03-01T05:30:29.3466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (126, 16, N'ATU16-XAM-S', 53, 36, 45, CAST(N'2025-03-01T05:30:44.3900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (127, 16, N'ATU16-XAM-M', 54, 36, 65, CAST(N'2025-03-01T05:30:41.5300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (128, 16, N'ATU16-XAM-L', 55, 36, 55, CAST(N'2025-03-01T05:30:39.4133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (129, 16, N'ATU16-XAM-XL', 56, 36, 35, CAST(N'2025-03-01T05:30:47.0933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (130, 17, N'VCCCBG17-HONGP-2-4', 57, 37, 40, CAST(N'2025-03-01T05:29:52.5600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (131, 17, N'VCCCBG17-HONGP-4-6', 58, 37, 50, CAST(N'2025-03-01T05:29:54.0866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (132, 17, N'VCCCBG17-HONGP-6-8', 59, 37, 35, CAST(N'2025-03-01T05:29:55.4700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (133, 17, N'VCCCBG17-TIML-2-4', 57, 38, 45, CAST(N'2025-03-01T05:29:57.4000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (134, 17, N'VCCCBG17-TIML-4-6', 58, 38, 55, CAST(N'2025-03-01T05:29:59.3200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (135, 17, N'VCCCBG17-TIML-6-8', 59, 38, 40, CAST(N'2025-03-01T05:30:01.0166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (136, 18, N'BNTT18-DEN-ONESIZE', 60, 39, 60, CAST(N'2025-03-01T05:29:39.2666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (137, 18, N'BNTT18-XAM-ONESIZE', 60, 40, 65, CAST(N'2025-03-01T05:29:40.9066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (138, 18, N'BNTT18-XANHN-ONESIZE', 60, 41, 55, CAST(N'2025-03-01T05:29:42.5666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (139, 19, N'DCBN19-BAC-40CM', 61, 42, 30, CAST(N'2025-03-01T05:29:22.3866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (140, 19, N'DCBN19-BAC-45CM', 62, 42, 40, CAST(N'2025-03-01T05:29:24.2033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (141, 19, N'DCBN19-BAC-50CM', 63, 42, 20, CAST(N'2025-03-01T05:29:29.950000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (142, 19, N'DCBN19-VANGH-40CM', 61, 43, 25, CAST(N'2025-03-01T05:29:25.8733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (143, 19, N'DCBN19-VANGH-45CM', 62, 43, 35, CAST(N'2025-03-01T05:29:27.5466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (144, 19, N'DCBN19-VANGH-50CM', 63, 43, 15, CAST(N'2025-03-01T05:29:31.7000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (145, 20, N'GCGN20-DEN-35', 64, 44, 25, CAST(N'2025-03-01T05:28:35.0333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (146, 20, N'GCGN20-DEN-36', 65, 44, 35, CAST(N'2025-03-01T05:28:37.2400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (147, 20, N'GCGN20-DEN-37', 66, 44, 45, CAST(N'2025-03-01T05:28:42.5166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (148, 20, N'GCGN20-DEN-38', 67, 44, 40, CAST(N'2025-03-01T05:28:44.7433333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (149, 20, N'GCGN20-DEN-39', 68, 44, 30, CAST(N'2025-03-01T05:28:40.6700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (150, 20, N'GCGN20-KEM-35', 64, 45, 20, CAST(N'2025-03-01T05:29:02.5600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (151, 20, N'GCGN20-KEM-36', 65, 45, 30, CAST(N'2025-03-01T05:29:05.3500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (152, 20, N'GCGN20-KEM-37', 66, 45, 40, CAST(N'2025-03-01T05:29:08.5833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (153, 20, N'GCGN20-KEM-38', 67, 45, 35, CAST(N'2025-03-01T05:29:11.8866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (154, 20, N'GCGN20-KEM-39', 68, 45, 25, CAST(N'2025-03-01T05:29:14.6566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (155, 20, N'GCGN20-DODO-35', 64, 46, 15, CAST(N'2025-03-01T05:28:49.3633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (156, 20, N'GCGN20-DODO-36', 65, 46, 25, CAST(N'2025-03-01T05:28:51.9500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (157, 20, N'GCGN20-DODO-37', 66, 46, 35, CAST(N'2025-03-01T05:28:54.7533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (158, 20, N'GCGN20-DODO-38', 67, 46, 30, CAST(N'2025-03-01T05:28:57.6900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (159, 20, N'GCGN20-DODO-39', 68, 46, 20, CAST(N'2025-03-01T05:29:00.1233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (160, 21, N'KMTT21-DEN-ONESIZE', 69, 47, 50, CAST(N'2025-03-01T05:28:23.5800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (161, 21, N'KMTT21-NAU-ONESIZE', 69, 48, 45, CAST(N'2025-03-01T05:28:25.1700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (162, 21, N'KMTT21-VANGG-ONESIZE', 69, 49, 40, CAST(N'2025-03-01T05:28:26.6266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (163, 22, N'ASMNKS22-TRANGSX-S', 70, 50, 35, CAST(N'2025-03-01T05:28:03.0966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (164, 22, N'ASMNKS22-TRANGSX-M', 71, 50, 50, CAST(N'2025-03-01T05:27:55.7566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (165, 22, N'ASMNKS22-TRANGSX-L', 72, 50, 40, CAST(N'2025-03-01T05:27:53.1566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (166, 22, N'ASMNKS22-TRANGSX-XL', 73, 50, 30, CAST(N'2025-03-01T05:28:05.5400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (167, 22, N'ASMNKS22-TRANGSD-S', 70, 51, 30, CAST(N'2025-03-01T05:27:49.6533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (168, 22, N'ASMNKS22-TRANGSD-M', 71, 51, 45, CAST(N'2025-03-01T05:27:47.7933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (169, 22, N'ASMNKS22-TRANGSD-L', 72, 51, 35, CAST(N'2025-03-01T05:27:45.6300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (170, 22, N'ASMNKS22-TRANGSD-XL', 73, 51, 25, CAST(N'2025-03-01T05:27:51.3533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (171, 22, N'ASMNKS22-XANHNST-S', 70, 52, 25, CAST(N'2025-03-01T05:28:13.2666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (172, 22, N'ASMNKS22-XANHNST-M', 71, 52, 40, CAST(N'2025-03-01T05:28:10.6200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (173, 22, N'ASMNKS22-XANHNST-L', 72, 52, 30, CAST(N'2025-03-01T05:28:08.2266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (174, 22, N'ASMNKS22-XANHNST-XL', 73, 52, 20, CAST(N'2025-03-01T05:28:16.0233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (175, 23, N'QJSN23-XANHD-S', 74, 53, 40, CAST(N'2025-03-01T05:27:17.650000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (176, 23, N'QJSN23-XANHD-M', 75, 53, 60, CAST(N'2025-03-01T05:27:14.9200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (177, 23, N'QJSN23-XANHD-L', 76, 53, 50, CAST(N'2025-03-01T05:27:09.6000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (178, 23, N'QJSN23-XANHD-XL', 77, 53, 30, CAST(N'2025-03-01T05:27:25.1033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (179, 23, N'QJSN23-DEN-S', 74, 54, 45, CAST(N'2025-03-01T05:27:03.9733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (180, 23, N'QJSN23-DEN-M', 75, 54, 65, CAST(N'2025-03-01T05:26:58.5833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (181, 23, N'QJSN23-DEN-L', 76, 54, 55, CAST(N'2025-03-01T05:26:57.0500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (182, 23, N'QJSN23-DEN-XL', 77, 54, 35, CAST(N'2025-03-01T05:27:02.2800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (183, 23, N'QJSN23-XANHN-S', 74, 55, 35, CAST(N'2025-03-01T05:27:32.9466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (184, 23, N'QJSN23-XANHN-M', 75, 55, 55, CAST(N'2025-03-01T05:27:30.5733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (185, 23, N'QJSN23-XANHN-L', 76, 55, 45, CAST(N'2025-03-01T05:27:28.0966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (186, 23, N'QJSN23-XANHN-XL', 77, 55, 25, CAST(N'2025-03-01T05:27:35.6400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (187, 24, N'ALOU24-KEM-S', 78, 56, 30, CAST(N'2025-03-01T05:26:03.7366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (188, 24, N'ALOU24-KEM-M', 79, 56, 45, CAST(N'2025-03-01T05:26:02.1633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (189, 24, N'ALOU24-KEM-L', 80, 56, 40, CAST(N'2025-03-01T05:26:00.2733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (190, 24, N'ALOU24-KEM-XL', 81, 56, 25, CAST(N'2025-03-01T05:26:05.3500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (191, 24, N'ALOU24-XAM-S', 78, 57, 35, CAST(N'2025-03-01T05:26:48.7033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (192, 24, N'ALOU24-XAM-M', 79, 57, 50, CAST(N'2025-03-01T05:26:45.1800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (193, 24, N'ALOU24-XAM-L', 80, 57, 45, CAST(N'2025-03-01T05:26:24.5800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (194, 24, N'ALOU24-XAM-XL', 81, 57, 30, CAST(N'2025-03-01T05:26:51.6466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (195, 24, N'ALOU24-NAU-S', 78, 58, 25, CAST(N'2025-03-01T05:26:14.5733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (196, 24, N'ALOU24-NAU-M', 79, 58, 40, CAST(N'2025-03-01T05:26:11.5666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (197, 24, N'ALOU24-NAU-L', 80, 58, 35, CAST(N'2025-03-01T05:26:07.5566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (198, 24, N'ALOU24-NAU-XL', 81, 58, 20, CAST(N'2025-03-01T05:26:17.1166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (199, 25, N'TDCNM25-DEN-ONESIZE', 82, 59, 50, CAST(N'2025-03-01T05:25:49.2033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (200, 25, N'TDCNM25-HONG-ONESIZE', 82, 60, 45, CAST(N'2025-03-01T05:25:51.0066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (201, 25, N'TDCNM25-KEM-ONESIZE', 82, 61, 40, CAST(N'2025-03-01T05:25:52.7800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (202, 26, N'BTBHGN26-BAC-ONESIZE', 83, 62, 60, CAST(N'2025-03-01T05:25:41.6866667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (203, 26, N'BTBHGN26-VANGH-ONESIZE', 83, 63, 55, CAST(N'2025-03-01T05:25:43.2966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (204, 27, N'AKNC27-KEM-S', 84, 64, 35, CAST(N'2025-03-01T05:25:00.1066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (205, 27, N'AKNC27-KEM-M', 85, 64, 50, CAST(N'2025-03-01T05:24:56.8533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (206, 27, N'AKNC27-KEM-L', 86, 64, 40, CAST(N'2025-03-01T05:24:55.0133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (207, 27, N'AKNC27-XANHM-S', 84, 65, 30, CAST(N'2025-03-01T05:25:06.7300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (208, 27, N'AKNC27-XANHM-M', 85, 65, 45, CAST(N'2025-03-01T05:25:04.4333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (209, 27, N'AKNC27-XANHM-L', 86, 65, 35, CAST(N'2025-03-01T05:25:02.0933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (210, 27, N'AKNC27-HONGN-S', 84, 66, 25, CAST(N'2025-03-01T05:18:35.2833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (211, 27, N'AKNC27-HONGN-M', 85, 66, 40, CAST(N'2025-03-01T05:18:33.6066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (212, 27, N'AKNC27-HONGN-L', 86, 66, 30, CAST(N'2025-03-01T05:18:31.8800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (213, 28, N'DLNCC28-DEN-39', 87, 67, 45, CAST(N'2025-03-01T05:07:28.7233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (214, 28, N'DLNCC28-DEN-40', 88, 67, 60, CAST(N'2025-03-01T05:07:30.5033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (215, 28, N'DLNCC28-DEN-41', 89, 67, 55, CAST(N'2025-03-01T05:07:32.1733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (216, 28, N'DLNCC28-DEN-42', 90, 67, 50, CAST(N'2025-03-01T05:07:33.7733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (217, 28, N'DLNCC28-DEN-43', 91, 67, 40, CAST(N'2025-03-01T05:07:35.4500000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (218, 28, N'DLNCC28-NAU-39', 87, 68, 40, CAST(N'2025-03-01T05:07:37.6033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (219, 28, N'DLNCC28-NAU-40', 88, 68, 55, CAST(N'2025-03-01T05:07:40.4733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (220, 28, N'DLNCC28-NAU-41', 89, 68, 50, CAST(N'2025-03-01T05:07:43.7200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (221, 28, N'DLNCC28-NAU-42', 90, 68, 45, CAST(N'2025-03-01T05:07:46.3200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (222, 28, N'DLNCC28-NAU-43', 91, 68, 35, CAST(N'2025-03-01T05:07:48.9600000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (223, 29, N'ATTEHH29-TRANGHT-2-4', 92, 69, 50, CAST(N'2025-03-01T05:06:43.150000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (224, 29, N'ATTEHH29-TRANGHT-4-6', 93, 69, 65, CAST(N'2025-03-01T05:06:48.2166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (225, 29, N'ATTEHH29-TRANGHT-6-8', 94, 69, 55, CAST(N'2025-03-01T05:06:53.3000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (226, 29, N'ATTEHH29-TRANGHT-8-10', 95, 69, 45, CAST(N'2025-03-01T05:06:51.1733333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (227, 29, N'ATTEHH29-XANHDTHT-2-4', 92, 70, 45, CAST(N'2025-03-01T05:07:10.9900000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (228, 29, N'ATTEHH29-XANHDTHT-4-6', 93, 70, 60, CAST(N'2025-03-01T05:07:20.0133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (229, 29, N'ATTEHH29-XANHDTHT-6-8', 94, 70, 50, CAST(N'2025-03-01T05:07:17.0166667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (230, 29, N'ATTEHH29-XANHDTHT-8-10', 95, 70, 40, CAST(N'2025-03-01T05:07:14.2666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (231, 29, N'ATTEHH29-VANGHT-2-4', 92, 71, 40, CAST(N'2025-03-01T05:06:56.0033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (232, 29, N'ATTEHH29-VANGHT-4-6', 93, 71, 55, CAST(N'2025-03-01T05:06:58.2533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (233, 29, N'ATTEHH29-VANGHT-6-8', 94, 71, 45, CAST(N'2025-03-01T05:07:01.850000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (234, 29, N'ATTEHH29-VANGHT-8-10', 95, 71, 35, CAST(N'2025-03-01T05:07:06.8766667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (235, 30, N'NBDDZ30-BAC-5', 96, 72, 30, CAST(N'2025-03-01T04:44:23.9066667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (236, 30, N'NBDDZ30-BAC-6', 97, 72, 40, CAST(N'2025-03-01T04:44:30.8933333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (237, 30, N'NBDDZ30-BAC-7', 98, 72, 35, CAST(N'2025-03-01T04:57:43.5466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (238, 30, N'NBDDZ30-BAC-8', 99, 72, 25, CAST(N'2025-03-01T04:57:45.6966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (239, 30, N'NBDDZ30-VANGH-5', 96, 73, 25, CAST(N'2025-03-01T05:05:25.7800000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (240, 30, N'NBDDZ30-VANGH-6', 97, 73, 35, CAST(N'2025-03-01T05:06:23.2533333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (241, 30, N'NBDDZ30-VANGH-7', 98, 73, 30, CAST(N'2025-03-01T05:06:26.2366667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (242, 30, N'NBDDZ30-VANGH-8', 99, 73, 20, CAST(N'2025-03-01T05:06:29.0633333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (243, 31, N'CVXLDN31-DEN-S', 100, 74, 40, CAST(N'2025-03-01T04:26:19.1566667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (244, 31, N'CVXLDN31-DEN-M', 101, 74, 55, CAST(N'2025-03-01T04:26:17.3833333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (245, 31, N'CVXLDN31-DEN-L', 102, 74, 45, CAST(N'2025-03-01T04:26:15.5300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (246, 31, N'CVXLDN31-XAM-S', 100, 75, 35, CAST(N'2025-03-01T04:26:39.4000000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (247, 31, N'CVXLDN31-XAM-M', 101, 75, 50, CAST(N'2025-03-01T04:26:32.6266667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (248, 31, N'CVXLDN31-XAM-L', 102, 75, 40, CAST(N'2025-03-01T04:26:29.6300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (249, 31, N'CVXLDN31-KEC-S', 100, 76, 30, CAST(N'2025-03-01T05:05:18.6300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (250, 31, N'CVXLDN31-KEC-M', 101, 76, 45, CAST(N'2025-03-01T05:05:16.5200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (251, 31, N'CVXLDN31-KEC-L', 102, 76, 35, CAST(N'2025-03-01T05:04:58.2700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (252, 32, N'QKN32-HONG-28', 103, 80, 45, CAST(N'2025-03-01T04:25:44.3400000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (253, 32, N'QKN32-BE-30', 104, 77, 60, CAST(N'2025-03-01T04:15:31.7700000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (254, 32, N'QKN32-BE-32', 105, 77, 55, CAST(N'2025-03-01T04:15:34.3033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (255, 32, N'QKN32-BE-34', 106, 77, 40, CAST(N'2025-03-01T04:15:36.9300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (256, 32, N'QKN32-BE-36', 107, 77, 30, CAST(N'2025-03-01T04:15:39.3333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (257, 32, N'QKN32-XANHN-28', 103, 78, 40, CAST(N'2025-03-01T05:04:34.5466667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (258, 32, N'QKN32-XANHN-30', 104, 78, 55, CAST(N'2025-03-01T05:04:41.9300000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (259, 32, N'QKN32-XANHN-32', 105, 78, 50, CAST(N'2025-03-01T05:04:45.7666667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (260, 32, N'QKN32-XANHN-34', 106, 78, 35, CAST(N'2025-03-01T05:04:48.6333333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (261, 32, N'QKN32-XANHN-36', 107, 78, 25, CAST(N'2025-03-01T05:04:51.2233333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (262, 32, N'QKN32-DEN-28', 103, 79, 35, CAST(N'2025-03-01T04:24:59.3200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (263, 32, N'QKN32-DEN-30', 104, 79, 50, CAST(N'2025-03-01T04:25:22.7033333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (264, 32, N'QKN32-DEN-32', 105, 79, 45, CAST(N'2025-03-01T04:25:25.0966667' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (265, 32, N'QKN32-DEN-34', 106, 79, 30, CAST(N'2025-03-01T04:25:29.8200000' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (266, 32, N'QKN32-DEN-36', 107, 79, 20, CAST(N'2025-03-01T04:25:33.5133333' AS DateTime2))
GO
INSERT [dbo].[product_variants] ([id], [product_id], [sku], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (268, 32, N'QKN32-DO-36', 107, 81, 1, CAST(N'2025-03-01T04:25:38.7000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[product_variants] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_items] ON 
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (2, 1, 2, 3, 3)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (3, 2, 3, 2, 3)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (4, 3, 1, 1, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (6, 1, 1, 1, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (7, 1, 2, 3, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (8, 2, 3, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (1, N'Xu hướng thời trang mùa xuân 2025', N'https://mcdn.coolmate.me/image/December2022/xu-huong-thoi-trang-xuan-he-2023-805_866.jpg', N'Mùa xuân năm 2025 là thời trang màu sắc nổi bật và bền vững...', N'Mùa xuân năm 2025 là thời trang màu sắc nổi bật và bền vững. Mùa này mang đến góc nhìn mới mẻ về phong cách cổ điển với sự nhấn mạnh vào vật liệu thân thiện với môi trường và những món đồ đa năng có thể tạo kiểu theo nhiều cách. Các xu hướng chính bao gồm chủ nghĩa tối giản màu pastel, áo khoác oversize và denim bền vững.', 4, 1, N'published', CAST(N'2024-01-15T10:00:00.0000000' AS DateTime2), CAST(N'2024-01-15T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (2, N'Làm thế nào để xây dựng một tủ quần áo con nhộng', N'https://songxanhsongkhoe.vn/wp-content/uploads/2020/11/co-gai-dung-truoc-tu-quan-an-va-sap-xep-tu-do-con-nhong-1-1024x683.jpg', N'Tủ quần áo con nhộng là giải pháp hoàn hảo cho những ai...', N'Tủ quần áo con nhộng là giải pháp hoàn hảo cho những ai muốn giảm thiểu quần áo trong khi vẫn tối đa hóa các lựa chọn về phong cách. Hướng dẫn toàn diện này sẽ hướng dẫn bạn cách lựa chọn những món đồ thiết yếu, phối hợp màu sắc và chuyển mùa.', 4, 1, N'published', CAST(N'2024-01-20T14:30:00.0000000' AS DateTime2), CAST(N'2024-01-20T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (3, N'Thời trang bền vững: Hướng dẫn đầy đủ', N'https://tse1.mm.bing.net/th?id=OIP.jBJ4gAN070RxCwsuzGaMZAHaFF&pid=Api&P=0&h=180', N'Thời trang bền vững không chỉ là một xu hướng - mà còn...', N'Thời trang bền vững không chỉ là một xu hướng - mà còn là điều cần thiết cho tương lai của hành tinh chúng ta. Tìm hiểu về vật liệu thân thiện với môi trường, quy trình sản xuất có đạo đức và cách đưa ra những lựa chọn bền vững hơn khi mua thời trang.', 4, 0, N'published', CAST(N'2024-01-25T09:15:00.0000000' AS DateTime2), CAST(N'2024-01-25T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (4, N'Xu hướng màu sắc cho mùa hè năm 2025', N'https://cdn.vuahanghieu.com/unsafe/1200x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/2021/10/15-xu-huong-mau-sac-thoi-trang-trend-mua-thu-dong-2021-06102021134538.jpg', N'Mùa hè năm 2025 đánh dấu sự trở lại mạnh mẽ...', N'Mùa hè năm 2025 đánh dấu sự trở lại mạnh mẽ của phong cách cổ điển trong thời trang, khi các xu hướng từ thập kỷ trước được tái hiện với những biến tấu hiện đại, tạo nên sự giao thoa độc đáo giữa quá khứ và hiện tại. Bên cạnh đó, bảng màu của mùa hè năm nay cũng vô cùng rực rỡ và đa dạng, phản ánh sự kết nối giữa con người và thiên nhiên. Những gam màu nổi bật bao gồm Future Dusk – sắc xanh lam đậm đầy bí ẩn, Transcendent Pink – hồng nhẹ nhàng thể hiện sự tinh tế, Aquatic Awe – xanh ngọc bích tươi mát như đại dương, Sunset Coral – cam san hô ấm áp như ánh hoàng hôn, và Ray Flower – vàng rực rỡ tràn đầy năng lượng. Sự kết hợp giữa phong cách cổ điển và bảng màu ấn tượng này không chỉ tạo nên những bộ trang phục vừa hoài cổ vừa hiện đại mà còn mang đến cảm giác tin cậy, ổn định trong một thế giới đang không ngừng thay đổi.', 4, 1, N'published', CAST(N'2024-02-01T11:45:00.0000000' AS DateTime2), CAST(N'2024-02-01T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (5, N'Phụ kiện 101: Hướng dẫn đầy đủ', N'https://cf.shopee.vn/file/b849b807196691d47472df6073839200', N'Tìm hiểu các nguyên tắc cơ bản về phụ kiện, từ việc...', N'Tìm hiểu các nguyên tắc cơ bản về phụ kiện, từ việc lựa chọn đồ trang sức phù hợp đến việc lựa chọn túi xách và giày dép phù hợp với trang phục của bạn. Hướng dẫn toàn diện này bao gồm mọi thứ từ những dịp bình thường đến trang trọng.', 4, 0, N'draft', CAST(N'2024-02-05T16:20:00.0000000' AS DateTime2), CAST(N'2024-02-05T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (6, N'Kỹ thuật xếp lớp cho mùa đông', N'https://tiki.vn/blog/wp-content/uploads/2023/03/mix-do-mua-dong-phong-cach-han-quoc.jpg', N'Tìm hiểu cách kết hợp các kết cấu và...', N'Tìm hiểu cách kết hợp các kết cấu và mảnh ghép khác nhau để tạo nên những bộ trang phục mùa đông ấm áp và thời trang. Từ lớp lót giữ nhiệt đến áo khoác nổi bật, chúng tôi sẽ chia nhỏ các kỹ thuật thiết yếu để luôn sang trọng và thoải mái.', 4, 1, N'published', CAST(N'2024-02-10T10:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (7, N'Những cải tiến về vải thân thiện với môi trường', N'https://dongphucthanhhung.vn/wp-content/uploads/2023/05/vai-than-thien-voi-moi-truong.jpg', N'Những cải tiến về vải thân thiện với môi trường đang...', N'Những cải tiến về vải thân thiện với môi trường đang trở thành xu hướng quan trọng trong ngành thời trang bền vững. Các chất liệu như sợi tre, vải từ tảo biển, sợi dứa Piñatex hay polyester tái chế (rPET) không chỉ giúp giảm tác động tiêu cực đến môi trường mà còn mang lại sự thoải mái và bền bỉ cho người sử dụng. Bên cạnh đó, công nghệ sản xuất hiện đại đã giúp tối ưu hóa quy trình dệt may, giảm đáng kể lượng nước, hóa chất và rác thải. Những thay đổi này không chỉ hướng tới việc bảo vệ hành tinh mà còn mở ra một tương lai bền vững hơn cho ngành công nghiệp thời trang.', 4, 0, N'published', CAST(N'2024-02-15T14:30:00.0000000' AS DateTime2), CAST(N'2024-02-15T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (8, N'Những vật dụng thiết yếu cho tủ đồ tối giản', N'https://noithatminhkhoi.com/upload/images/xay-dung-tu-quan-ao-toi-gian-cho-nam-gioi-04.jpg', N'Một tủ đồ tối giản không cần quá nhiều...', N'Một tủ đồ tối giản không cần quá nhiều món đồ nhưng vẫn đảm bảo tính linh hoạt và phong cách. Những vật dụng thiết yếu như áo sơ mi trắng, áo thun trơn, quần jeans tối màu hay blazer giúp bạn dễ dàng phối hợp trang phục cho nhiều dịp khác nhau. Bên cạnh đó, một đôi giày thể thao thoải mái và giày da thanh lịch sẽ giúp bạn luôn sẵn sàng cho cả ngày thường lẫn sự kiện quan trọng. Kết hợp với túi xách đa năng và một vài phụ kiện tinh tế, tủ đồ tối giản không chỉ giúp tiết kiệm thời gian mà còn tạo nên vẻ ngoài hiện đại, tinh tế và không bao giờ lỗi mốt.', 4, 1, N'published', CAST(N'2024-02-20T09:15:00.0000000' AS DateTime2), CAST(N'2024-02-20T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (9, N'Sự hồi sinh của thời trang cổ điển', N'https://www.elle.vn/wp-content/uploads/2019/07/19/Su-khac-biet-giua-thoi-trang-phong-cach-vintage-va-retro.jpg', N'Phong cách cổ điển đang quay trở lại mạnh mẽ...', N'Phong cách cổ điển đang quay trở lại mạnh mẽ trong nhiều lĩnh vực như thời trang, nội thất, thiết kế đồ họa và nghệ thuật. Xu hướng này không chỉ đơn thuần là việc tái hiện lại quá khứ mà còn là sự kết hợp giữa nét đẹp truyền thống với yếu tố hiện đại, tạo ra một phong cách tân cổ điển (Neo-Classic) đầy tinh tế.', 1, 0, N'published', CAST(N'2024-02-25T11:45:00.0000000' AS DateTime2), CAST(N'2024-02-25T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (10, N'Quần áo tích hợp công nghệ', N'https://media-cdn-v2.laodong.vn/storage/newsportal/2022/6/14/1056388/Vr-And-Ar-For-Busine.jpg', N'Quần áo tích hợp công nghệ đang trở thành...', N'Quần áo tích hợp công nghệ đang trở thành xu hướng mới trong ngành thời trang, mang lại sự tiện lợi và trải nghiệm hiện đại cho người dùng. Từ áo khoác có khả năng tự điều chỉnh nhiệt độ, vải chống thấm nước nhưng vẫn thoáng khí, đến quần áo thể thao có cảm biến theo dõi sức khỏe, công nghệ đang thay đổi cách chúng ta mặc và sử dụng trang phục hàng ngày. Ngoài ra, các chất liệu thông minh như vải dẫn điện, vải đổi màu theo môi trường hay trang phục có thể kết nối với thiết bị di động đang mở ra một kỷ nguyên mới cho thời trang ứng dụng. Với sự kết hợp giữa thẩm mỹ và công nghệ, quần áo thông minh không chỉ đáp ứng nhu cầu tiện nghi mà còn giúp nâng cao chất lượng cuộc sống.', 4, 1, N'published', CAST(N'2024-03-01T16:20:00.0000000' AS DateTime2), CAST(N'2024-03-01T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (11, N'Mẹo thời trang tiết kiệm', N'https://songkhoeannhien.vn/wp-content/uploads/2023/02/Lua-chon-quan-ao-vai-tot-skan-2000x1333.jpg', N'Thời trang tiết kiệm không có nghĩa...', N'Thời trang tiết kiệm không có nghĩa là phải từ bỏ phong cách, mà ngược lại, bạn có thể vẫn sành điệu mà không tốn quá nhiều chi phí. Trước tiên, hãy đầu tư vào những món đồ cơ bản và dễ phối như áo sơ mi trắng, quần jeans và blazer – những item không bao giờ lỗi mốt. Thứ hai, săn sale thông minh bằng cách theo dõi các đợt giảm giá lớn hoặc mua sắm tại các cửa hàng second-hand, nơi bạn có thể tìm được nhiều món đồ độc đáo với giá rẻ. Ngoài ra, học cách mix & match giúp bạn tận dụng tối đa tủ đồ mà không cần mua sắm liên tục. Cuối cùng, bảo quản quần áo đúng cách sẽ giúp chúng bền hơn, giúp bạn tiết kiệm chi phí thay thế. Với những mẹo này, bạn hoàn toàn có thể xây dựng phong cách riêng mà không cần tiêu tốn quá nhiều tiền.', 4, 0, N'published', CAST(N'2024-03-05T10:00:00.0000000' AS DateTime2), CAST(N'2024-03-05T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (12, N'Ảnh hưởng của văn hóa trong thời trang', N'https://aodaivietnam.vceo.vn/images/upload/images/a8-1400520557-700x0-1400555235_680x0.jpg', N'Văn hóa ảnh hưởng sâu sắc đến thời trang,...', N'Văn hóa ảnh hưởng sâu sắc đến thời trang, từ trang phục truyền thống đến xu hướng hiện đại. Mỗi nền văn hóa mang đến những màu sắc, họa tiết và kiểu dáng đặc trưng, giúp định hình phong cách thời trang đa dạng. Bên cạnh đó, âm nhạc, nghệ thuật và phong trào xã hội cũng góp phần tạo ra những xu hướng mới. Sự giao thoa giữa các nền văn hóa trong thời đại toàn cầu hóa giúp thời trang ngày càng phong phú, kết hợp giữa truyền thống và hiện đại, góp phần lan tỏa giá trị văn hóa trên toàn thế giới.', 4, 1, N'published', CAST(N'2024-03-10T14:30:00.0000000' AS DateTime2), CAST(N'2024-03-10T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (13, N'Thiết kế giày bền vững', N'https://static.ybox.vn/2015/08/c55b53fec37cc226e1ed8ffeb10d7f33.jpg', N'Thiết kế giày bền vững đang trở thành...', N'Thiết kế giày bền vững đang trở thành xu hướng quan trọng trong ngành thời trang, hướng đến việc giảm thiểu tác động tiêu cực đến môi trường. Các thương hiệu ngày càng chú trọng sử dụng vật liệu tái chế, hữu cơ hoặc có khả năng phân hủy sinh học như da thực vật, nhựa tái chế và cao su tự nhiên. Bên cạnh đó, quy trình sản xuất cũng được tối ưu hóa để tiết kiệm năng lượng và giảm lượng khí thải. Không chỉ thân thiện với môi trường, giày bền vững còn được thiết kế để đảm bảo độ bền cao, giúp người tiêu dùng sử dụng lâu dài và hạn chế rác thải thời trang.', 4, 0, N'published', CAST(N'2024-03-15T09:15:00.0000000' AS DateTime2), CAST(N'2024-03-15T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (14, N'Xu hướng nhiếp ảnh thời trang', N'https://lh4.googleusercontent.com/G-N1LdssK9CFqmlFcq9e6SUDeBLlwYVhcDxZNwgDDZmtcaEkmH-xsB3jrdQqSOdjjGLNVbe7YTN9V91Ywq1CCOjUN65wl3IhQHzVp3Juzh5G9Vub7Iss4v7CWZLU17hL8eqO8Eb8', N'Xu hướng nhiếp ảnh thời trang đang...', N'Xu hướng nhiếp ảnh thời trang đang không ngừng thay đổi, phản ánh sự kết hợp giữa nghệ thuật, công nghệ và văn hóa đương đại. Những phong cách hoài cổ như film photography đang quay trở lại, mang đến cảm giác chân thực và giàu cảm xúc. Bên cạnh đó, nhiếp ảnh thời trang hiện đại còn ứng dụng AI và công nghệ CGI để tạo ra những bộ ảnh mang đậm tính sáng tạo và siêu thực. Xu hướng "street style photography" cũng tiếp tục được ưa chuộng, tập trung vào sự tự nhiên và phong cách cá nhân. Ngoài ra, việc đề cao tính bền vững trong nhiếp ảnh thời trang ngày càng phổ biến, với các chiến dịch quảng cáo ưu tiên sử dụng ánh sáng tự nhiên và hạn chế tác động đến môi trường.', 4, 1, N'draft', CAST(N'2024-03-20T11:45:00.0000000' AS DateTime2), CAST(N'2024-03-20T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (15, N'Phát triển phong cách cá nhân', N'https://ims.baoyenbai.com.vn/NewsImg/6_2023/286023_1tt.jpg', N'Phát triển phong cách cá nhân là...', N'Phát triển phong cách cá nhân là một quá trình khám phá và thể hiện bản thân thông qua thời trang. Thay vì chạy theo xu hướng, hãy tìm ra những trang phục, màu sắc và kiểu dáng phù hợp với cá tính và lối sống của bạn. Việc hiểu rõ vóc dáng, sở thích và cảm hứng từ các nền văn hóa khác nhau sẽ giúp bạn xây dựng một phong cách độc đáo. Ngoài ra, đầu tư vào những món đồ cơ bản nhưng chất lượng, kết hợp với phụ kiện tinh tế, cũng là cách để tạo dấu ấn riêng. Quan trọng nhất, phong cách cá nhân không chỉ nằm ở trang phục mà còn thể hiện qua sự tự tin và cách bạn thể hiện bản thân mỗi ngày.', 4, 0, N'published', CAST(N'2024-03-25T16:20:00.0000000' AS DateTime2), CAST(N'2024-03-25T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (16, N'Thương hiệu thời trang đạo đức', N'https://style-republik.com/wp-content/uploads/2021/12/Viettien.png', N'Thương hiệu thời trang đạo đức đang...', N'Thương hiệu thời trang đạo đức đang ngày càng thu hút sự quan tâm khi người tiêu dùng chú trọng hơn đến tính bền vững và trách nhiệm xã hội. Các thương hiệu này cam kết sử dụng nguyên liệu thân thiện với môi trường, quy trình sản xuất công bằng và đảm bảo điều kiện làm việc tốt cho người lao động. Họ thường áp dụng mô hình sản xuất minh bạch, sử dụng chất liệu hữu cơ, tái chế hoặc công nghệ tiên tiến để giảm thiểu tác động tiêu cực đến môi trường. Việc ủng hộ các thương hiệu này không chỉ giúp bảo vệ hành tinh mà còn góp phần thúc đẩy sự công bằng trong ngành thời trang.', 4, 1, N'published', CAST(N'2024-03-30T10:00:00.0000000' AS DateTime2), CAST(N'2024-03-30T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (17, N'Thời trang kỹ thuật số và Metaverse', N'https://bestprint.vn/wp-content/uploads/2022/07/1657921823_567_Cac-nha-ban-le-co-can-mot-chien-luoc-thoi.png', N'Thời trang kỹ thuật số và Metaverse đang...', N'Thời trang kỹ thuật số và Metaverse đang mở ra một kỷ nguyên mới, nơi quần áo không chỉ tồn tại trong thế giới thực mà còn hiện diện trong không gian ảo. Các thương hiệu lớn và nhà thiết kế đang phát triển trang phục kỹ thuật số, cho phép người dùng mua, mặc và trưng bày chúng trên các nền tảng Metaverse hoặc mạng xã hội. Công nghệ blockchain và NFT giúp xác thực quyền sở hữu của những món đồ này, tạo ra một thị trường mới đầy tiềm năng. Với sự phát triển của thực tế ảo (VR) và thực tế tăng cường (AR), thời trang không còn bị giới hạn bởi chất liệu vật lý mà có thể biến đổi linh hoạt theo môi trường số, mở ra cơ hội sáng tạo vô tận cho cả người tiêu dùng lẫn ngành công nghiệp thời trang.', 4, 0, N'draft', CAST(N'2024-04-05T14:30:00.0000000' AS DateTime2), CAST(N'2024-04-05T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (18, N'Cách mạng thời trang thích ứng', N'https://file.hstatic.net/200000775589/article/hippie-style_cd4cf3dfcf234ac7aa46653dd6b140cc.jpg', N'Cách mạng thời trang thích ứng đang...', N'Cách mạng thời trang thích ứng đang thay đổi cách chúng ta tiếp cận quần áo, tập trung vào tính linh hoạt, đa năng và bền vững. Các thiết kế ngày nay không chỉ đáp ứng nhu cầu thẩm mỹ mà còn có khả năng thích nghi với môi trường và lối sống của người mặc. Từ vải co giãn đa chiều, quần áo biến đổi theo thời tiết đến trang phục công nghệ cao giúp điều chỉnh nhiệt độ cơ thể, tất cả đều hướng đến sự tiện lợi và tối ưu hóa trải nghiệm cá nhân. Bên cạnh đó, các thương hiệu cũng đẩy mạnh sản xuất theo mô hình thời trang bền vững, sử dụng vật liệu tái chế và công nghệ thân thiện với môi trường. Đây không chỉ là một xu hướng mà còn là một cuộc cách mạng thay đổi cách chúng ta mặc và tiêu dùng thời trang.', 4, 1, N'published', CAST(N'2024-04-10T09:15:00.0000000' AS DateTime2), CAST(N'2024-04-10T09:15:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[posts] OFF
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] ON 
GO
INSERT [dbo].[tokenPassword] ([id], [token], [expiryTime], [isUsed], [UserID]) VALUES (2, N'dfe99b7b-3adc-4263-b819-ebca71ff6b2a', CAST(N'2025-02-09T17:41:58.857' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] OFF
GO
SET IDENTITY_INSERT [dbo].[coupons] ON 
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (1, N'ABC123XYZ', N'percentage', CAST(10.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), 50, 0, CAST(N'2025-06-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (2, N'DEF456UVW', N'fixed', CAST(20000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), NULL, 100, 0, CAST(N'2025-07-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (3, N'GHI789RST', N'percentage', CAST(15.00 AS Decimal(10, 2)), CAST(75000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 75, 0, CAST(N'2025-08-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (4, N'JKL012PQR', N'fixed', CAST(30000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), NULL, 200, 0, CAST(N'2025-09-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (5, N'MNO345NOP', N'percentage', CAST(20.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), 50, 0, CAST(N'2025-10-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (6, N'STU678KLM', N'fixed', CAST(50000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), NULL, 25, 0, CAST(N'2025-11-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (7, N'VWX901HIJ', N'percentage', CAST(25.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 100, 0, CAST(N'2025-12-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (8, N'YZA234EFG', N'fixed', CAST(15000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)), NULL, 150, 0, CAST(N'2026-01-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (9, N'BCD567BCD', N'percentage', CAST(30.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), 30, 0, CAST(N'2026-02-28T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (10, N'EFG890YZA', N'fixed', CAST(25000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), NULL, 75, 0, CAST(N'2026-03-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (11, N'HIJ123VWX', N'percentage', CAST(5.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), 500, 0, CAST(N'2026-04-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (12, N'KLM456STU', N'fixed', CAST(5000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), NULL, NULL, 0, CAST(N'2026-05-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (13, N'NOP789MNO', N'percentage', CAST(12.50 AS Decimal(10, 2)), CAST(60000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)), 250, 0, CAST(N'2026-06-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (14, N'QRS012JKL', N'fixed', CAST(40000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), NULL, 40, 0, CAST(N'2025-01-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'expired')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (15, N'TUV345GHI', N'percentage', CAST(35.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 20, 0, CAST(N'2025-01-28T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'expired')
GO
SET IDENTITY_INSERT [dbo].[coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[footer_settings] ON 
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (1, N'info', N'Tên cửa hàng', N'Fashion Store', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (2, N'info', N'Giới thiệu', N'Chuyên bán quần áo thời trang', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (3, N'contact', N'Email', N'support@fashionstore.com', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (4, N'contact', N'Địa chỉ', N'thôn 4, xã Thạch Hòa, huyện Thạch Thất, Hà Nội', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (5, N'contact', N'Tổng đài hỗ trợ', N'+84 123 456 789', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (6, N'social', N'Facebook', N'https://facebook.com/fashion', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT83dd8_4WZCT-LsYC477q2WKocjms9OHCg0g&s', N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (7, N'social', N'Instagram', N'https://instagram.com/fashion', N'https://cdn-icons-png.freepik.com/256/15707/15707869.png?semt=ais_hybrid', N'active')
GO
SET IDENTITY_INSERT [dbo].[footer_settings] OFF
GO
SET IDENTITY_INSERT [dbo].[sliders] ON 
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (1, N'Summer Collection 2025', N'https://res.cloudinary.com/agnesb-group/image/upload/dpr_auto,f_auto,q_auto/v1/CMC/Content/D%C3%A9fil%C3%A9s/Collection%20Homme%20%C3%A9t%C3%A9%2025/videocolle25_1', N'http://localhost:9999/fashionshop/post?id=18', N'active', 1, N'Highlighting our newest summer collection with bright colors and lightweight fabrics')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (2, N'End of Season Sale - Up to 70% Off', N'https://bestprint.vn/wp-content/uploads/2022/07/1657921823_567_Cac-nha-ban-le-co-can-mot-chien-luoc-thoi.png', N'http://localhost:9999/fashionshop/post?id=17', N'active', 2, N'Major clearance sale on all winter items')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (3, N'New Arrivals - Spring Fashion', N'https://style-republik.com/wp-content/uploads/2021/12/Viettien.png', N'http://localhost:9999/fashionshop/post?id=16', N'active', 3, N'Featuring the latest spring trends and styles')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (4, N'Exclusive Designer Collection', N'https://ims.baoyenbai.com.vn/NewsImg/6_2023/286023_1tt.jpg', N'http://localhost:9999/fashionshop/post?id=15', N'active', 4, N'Premium designer wear for both men and women')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (5, N'Sport & Active Wear', N'https://lh4.googleusercontent.com/G-N1LdssK9CFqmlFcq9e6SUDeBLlwYVhcDxZNwgDDZmtcaEkmH-xsB3jrdQqSOdjjGLNVbe7YTN9V91Ywq1CCOjUN65wl3IhQHzVp3Juzh5G9Vub7Iss4v7CWZLU17hL8eqO8Eb8', N'http://localhost:9999/fashionshop/post?id=14', N'active', 5, N'High-performance sportswear for your active lifestyle')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (6, N'Wedding Season Special', N'https://static.ybox.vn/2015/08/c55b53fec37cc226e1ed8ffeb10d7f33.jpg', N'http://localhost:9999/fashionshop/post?id=13', N'active', 6, N'Elegant formal wear for wedding season')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (7, N'Kids Fashion Week', N'https://aodaivietnam.vceo.vn/images/upload/images/a8-1400520557-700x0-1400555235_680x0.jpg', N'http://localhost:9999/fashionshop/post?id=12', N'inactive', 7, N'Cute and comfortable clothing for children')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (8, N'Accessories Collection', N'https://songkhoeannhien.vn/wp-content/uploads/2023/02/Lua-chon-quan-ao-vai-tot-skan-2000x1333.jpg', N'http://localhost:9999/fashionshop/post?id=11', N'active', 8, N'Complete your look with our trendy accessories')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (9, N'Sustainable Fashion Line', N'https://media-cdn-v2.laodong.vn/storage/newsportal/2022/6/14/1056388/Vr-And-Ar-For-Busine.jpg', N'http://localhost:9999/fashionshop/post?id=10', N'active', 9, N'Eco-friendly clothing made from sustainable materials')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (10, N'Holiday Gift Guide', N'https://www.elle.vn/wp-content/uploads/2019/07/19/Su-khac-biet-giua-thoi-trang-phong-cach-vintage-va-retro.jpg', N'http://localhost:9999/fashionshop/post?id=9', N'inactive', 10, N'Perfect gift ideas for your loved ones')
GO
SET IDENTITY_INSERT [dbo].[sliders] OFF
GO
