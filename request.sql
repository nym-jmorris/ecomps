select 

g.EventCode
, concat(ua.FirstName,' ', ua.LastName) rname
, concat(r.RecipientFirstName,' ',+ r.RecipientLastName) recipient

from request r
join useraccount ua on r.requestor_id = ua.id
join game g on g.id= r.game_id

where g.is_archived =1