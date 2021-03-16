select 
  r.CreateDate
, r.is_approve

, g.EventCode
, g.OriginalGameDate
, t.Name
, concat(ua.FirstName,' ', ua.LastName) requestor
, concat(r.RecipientFirstName,' ',+ r.RecipientLastName) guest
, concat(a1.FirstName,' ',a1.LastName,': ', r.first_approver_status) approver1
, concat(a2.FirstName,' ',a2.LastName,': ', r.second_approver_status) approver2
, r.fulfil_date
, CONCAT(a3.FirstName,' ',a3.LastName) fulfilled_by
, r.UserComments

from request r
join useraccount ua on r.requestor_id = ua.id
join game g on g.id = r.game_id
join team t on t.id = g.team_id
left outer join useraccount a1 on r.first_approver = a1.id
left outer join useraccount a2 on r.second_approver = a2.id
left outer join useraccount a3 on r.fulfil_by = a3.id
where g.is_archived = 1

order by r.CreateDate