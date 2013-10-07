(* working with date in a tuple format int*int*int that represents 
 * year (4 digits) - month (1 to 12) - day ( 1 - 31 )
 *)

fun is_older( d1 : int*int*int, d2 : int*int*int ) =
        ( #1 d1 * 365 ) + ( #2 d1 * 30 ) + ( #3 d1 ) < ( #1 d2 * 365 ) + ( #2 d2
        * 30 ) + ( #3 d2 )

fun number_in_month( dates : ( int*int*int ) list, month : int ) =
        if null dates
        then 0
        else if (#2 (hd dates) = month)
        then 1 + number_in_month( tl dates, month)
        else number_in_month( tl dates, month)

fun number_in_months ( dates : ( int*int*int ) list, months: int list) =
        if ( null dates ) orelse ( null months )
        then 0
        else number_in_month(dates, hd months) + number_in_months( dates, tl
        months )

fun dates_in_month( dates : ( int*int*int ) list, month : int) =
        if null dates
        then []
        else if ( #2 (hd dates) = month)
        (* we could use hd dates here instead of populating tuple from each
         * element *)
        then (#1 (hd dates), #2 (hd dates), #3 (hd dates)) :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month)

fun dates_in_months ( dates : ( int*int*int ) list, months : int list ) =
        if ( null dates) orelse ( null months )
        then []
        else dates_in_month(dates, hd months) :: dates_in_months(dates, tl
        months)


(* 6 *)
fun get_nth( strings : string list, n : int ) = 
        if n = 1
        then hd strings
        else get_nth( tl strings, n-1 )
