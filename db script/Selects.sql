create procedure GetAllUsers
as
    begin
        select username,email,R2.role from Users inner join Roles R2 on Users.role = R2.id
    end
go
create procedure GetAllReviews
as
    begin
        select R.id,shop_id,country, city, street, building,SC.name,ST.type,S.avg_rating,username,review_text,score from Reviews as R
        inner join Shops S on R.shop_id = S.id
        inner join Adresses A on S.adress = A.id
        inner join Store_Chains SC on S.store_chain = SC.id
        inner join Shop_Types ST on S.shop_type = ST.id
        order by R.id desc
    end
go
create procedure GetAllRoles
as
    begin
        select id,role from Roles
    end
go
create procedure GetAllShopTypes
as
    begin
        select id,type  from Shop_Types
    end
go
create procedure GetAllShops
as
    begin
        select S.id,SC.name,ST.type,country,city, street, building, avg_rating from Shops as S
            inner join Adresses A on S.adress = A.id
            inner join Store_Chains SC on S.store_chain = SC.id
            inner join Shop_Types ST on S.shop_type = ST.id
    end
go
create procedure GetShopsByStoreChainName
    @store_chain nvarchar(50)
    as
    begin
        select S.id, SC.name, ST.type, country, city, street, building, avg_rating  from Shops as S
            inner join Adresses A on S.adress = A.id
            inner join Shop_Types ST on S.shop_type = ST.id
            inner join Store_Chains SC on S.store_chain = SC.id
            where store_chain=(select id from Store_Chains where name=@store_chain)
    end
go
create procedure GetShopsByStoreChainID
    @store_chain int
    as
    begin
        select S.id, SC.name, ST.type, country, city, street, building, avg_rating  from Shops as S
            inner join Adresses A on S.adress = A.id
            inner join Shop_Types ST on S.shop_type = ST.id
            inner join Store_Chains SC on S.store_chain = SC.id
            where store_chain=@store_chain
    end
go
create procedure GetAllStoreChains
as
    begin
        select id,name from Store_Chains
    end
go
create procedure GetAllReviewsByShop
@shopID int
as
    begin
        select id, username,review_text,score from Reviews where shop_id=@shopID
    end
go
create procedure GetAllReviewsByUser
@username nvarchar(50)
as
    begin
        select R.id,SC.name,ST.type,country, city, street, building,review_text,score from Reviews as R
            inner join Shops S on R.shop_id = S.id
            inner join Adresses A on S.adress = A.id
            inner join Shop_Types ST on S.shop_type = ST.id
            inner join Store_Chains SC on S.store_chain = SC.id
        where username=@username
    end
go
create procedure GetAllReviewsByStoreChainId
@chainID int
as
    begin
        select R.id,ST.type,country, city, street, building,review_text,score from Reviews as R
            inner join Shops S on R.shop_id = S.id
            inner join Adresses A on S.adress = A.id
            inner join Shop_Types ST on S.shop_type = ST.id
            inner join Store_Chains SC on S.store_chain = SC.id
        where store_chain=@chainID
    end
go
create procedure GetAllReviewsByStoreChainName
@chainName nvarchar(50)
as
    begin
        select R.id,ST.type,country, city, street, building,review_text,score from Reviews as R
            inner join Shops S on R.shop_id = S.id
            inner join Adresses A on S.adress = A.id
            inner join Shop_Types ST on S.shop_type = ST.id
            inner join Store_Chains SC on S.store_chain = SC.id
        where SC.name=@chainName
    end
go