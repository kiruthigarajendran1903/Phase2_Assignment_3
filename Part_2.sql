use ThirdExerciseDb

create table Products(PId int primary key,PQ int ,PPrice float,
Discount Decimal(5,2))

insert into Products(PId,PQ,PPrice,Discount) values
(100,9,1200.50,10.15),
(101,25,25000.90,21.30),
(102,45,85000.60,25.00)

select * from Products

create function fnDiscvalue(
@Price float ,
@Discount float
)
returns float
as 
begin
declare @DiscountedValue float;
set @DiscountedValue = @Price - (@Price * (@Discount/100.0))
return @DiscountedValue
end

select PId,PPrice Price,Discount,dbo.fnDiscvalue(PPrice,Discount) as 'Price After Discount' 
from Products