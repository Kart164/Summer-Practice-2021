create procedure CheckExistenceOfUsername
    @username nvarchar(50)
    as
    begin
        if exists(select username from Users where username=@username)
            return (1)
        else
            return (0)
    end
go

create PROCEDURE LoginAndGetRole
    @username nvarchar(50),
    @pass nvarchar(max)
    as
    begin
        declare @checkExistRes int
        exec @checkExistRes=CheckExistenceOfUsername @username
        if @checkExistRes>0
            if exists(select username, password from Users where username=@username and password=@pass)
                begin
                declare @role nvarchar(50)
                set @role=(select top 1 Role from Roles where id=(select top 1 role from Users where username=@username))
                return (@role)
                end
            else
                return (0)
        else
            return (0)
    end
go

create procedure UpdateShopScore
    @shopId int
    as
    begin
        declare @avgScore int
        set @avgScore= (select avg(score) from Reviews where shop_id=@shopId)
        begin try
            update Shops set avg_rating  = @avgScore  where id=@shopId
            return (1)
        end try
        begin catch
            print ERROR_MESSAGE()
            return (0)
        end catch
    end
go


create procedure AddUser
    @username nvarchar(50),
    @password nvarchar(max),
    @email nvarchar(50),
    @role int
as
    begin try
        insert Users values (@username, @password,@email,@role)
        return(1)
    end try
    begin catch
        PRINT ERROR_MESSAGE()
        return(0)
    end catch
go

create procedure DeleteUser
    @username nvarchar(50)
    as
        begin try
            delete from Users where username=@username
            return (1)
        end try
        begin catch
            print ERROR_MESSAGE()
            return (0)
        end catch
go

create procedure UpdateUserPassword
    @username nvarchar(50),
    @password nvarchar(max)
    as
    begin
        begin try
            if Len(@password)>4
            begin
                update Users set password=@password where username=@username
                return (1)
            end
            else
                return (0)
        end try
        begin catch
            print ERROR_MESSAGE()
            return (0)
        end catch
    end
go

create procedure UpdateUserEmail
    @username nvarchar(50),
    @email nvarchar(50)
    as
    begin try
        update Users set email =@email  where username=@username
        return (1)
    end try
    begin catch
        print ERROR_MESSAGE()
        return (0)
    end catch
go
create procedure UpdateUserRole
    @username nvarchar(50),
    @role smallint
    as
    begin try
        if exists(select id from Roles where id=@role)
        begin
            update Users set role =@role  where username=@username
            return (1)
        end
        else
            return (0)
    end try
    begin catch
        print ERROR_MESSAGE()
        return (0)
    end catch
go

create procedure AddShop
    @country nvarchar(50),
    @city nvarchar(50),
    @street nvarchar(50),
    @building nvarchar(50),
    @store_chain nvarchar(50),
    @shop_type int
    as
        declare @addressID int
        set @addressID= (select top 1 id from Adresses where country=@country and city=@city
                                            and street=@street and building=@building)
        declare @chainID int
            set @chainID = (select top 1 id from Store_Chains where name=@store_chain)
        if @addressID<1
            begin 
                insert Adresses values (@country,@city,@street,@building)
                set @addressID=(select top 1 id from Adresses ORDER BY id DESC)
            end
        if @chainID <1
            begin
                insert Store_Chains values (@store_chain)
                set @chainID =(select top 1 id from Store_Chains order by id desc)
            end
        begin try
            insert Shops values (@addressID,@chainID,@shop_type,default)
            return (1)
        end try
        begin catch
            print ERROR_MESSAGE()
            return (0)
        end catch
 go
            
create procedure UpdateShopAdress
    @country nvarchar(50),
    @city nvarchar(50),
    @street nvarchar(50),
    @building nvarchar(50),
    @shopID int
    as
    if exists(select id from Shops where id=@shopID)
    begin
        declare @addressID int
        set @addressID= (select top 1 id from Adresses where country=@country and city=@city
                                            and street=@street and building=@building)
        if @addressID<1
            begin
                insert Adresses values (@country,@city,@street,@building)
                set @addressID = (select top 1 id from Adresses ORDER BY id DESC)
            end

        begin try
            update Shops set adress=@addressID where id=@shopID
            return(1)
        end try
        begin catch
            print ERROR_MESSAGE()
            return(0)
        end catch
    end
    else return (0)
go

create procedure UpdateShopStoreChain
    @shopID int,
    @storeChain nvarchar(50)
    as
        if exists(select id from Shops where id=@shopID)
        begin
            declare @chainId int
            set @chainId=(select top 1 id from Store_Chains where name=@storeChain)
            if @chainId<1
                begin
                    insert Store_Chains values (@storeChain)
                    set @chainId=(select top 1 id from Store_Chains order by id desc)
                end
            begin try
                update Shops set store_chain=@chainId where id=@shopID
                return (1)
            end try
            begin catch
                print ERROR_MESSAGE()
                return (0)
            end catch
        end
        else
            return (0)
go

create procedure UpdateShopType
    @shopId int,
    @shopType int
    as
    if exists(select id from Shops where id=@shopId)
        begin try
            update Shops set shop_type=@shopType where id=@shopId
            return (1)
        end try
        begin catch
            print ERROR_MESSAGE()
            return (0)
        end catch
    else
        return (0)
go

create procedure DeleteShop
    @shopId int
    as
        if exists(select id from Shops where id=@shopId)
            begin
                delete from Shops where id=@shopId
                return (1)
            end
        else
            return (0)
go

create procedure AddReview
    @username nvarchar(50),
    @shopId int,
    @text text,
    @score smallint
    as
    if exists(select id from Shops where id=@shopId) and
        exists(select username from Users where username=@username)
        begin try
            insert Reviews values (@shopId,@username,@text,@score)
            exec UpdateShopScore @shopId
            return (1)
        end try
        begin catch
            print ERROR_MESSAGE()
            return (0)
        end catch
    else return (0)
go

create procedure DeleteReview
    @reviewID int
    as
    begin
        declare @shopId int
        if exists(select id from Reviews where id=@reviewID)
            begin
                set @shopId = (select shop_id from Reviews where id=@reviewID)
                begin try
                    delete from Reviews where id=@reviewID
                    exec UpdateShopScore @shopId
                    return (1)
                end try
                begin catch
                    print error_message()
                    return (0)
                end catch
            end
        else return (0)
    end
go

create procedure UpdateReview
    @id int,
    @text text,
    @score smallint
    as
    begin
       declare @shopId int
        if exists(select id from Reviews where id=@id)
            begin try
                update Reviews
                    set review_text =@text, score=@score
                    where id=@id;
                set @shopId = (select shop_id from Reviews where id=@id)
                exec UpdateShopScore @shopId
                return (1)
            end try
            begin catch
                print ERROR_MESSAGE()
                return (0)
            end catch
        else
            return (0)
    end
go

