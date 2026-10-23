let () =
  let body = {|{"event_id":"evt_demo","event_type":"transaction.completed","occurred_at":"2026-01-01T00:00:00Z","notification_id":"ntf_demo","data":{"id":"txn_demo"}}|} in
  Printf.printf "Local Paddle webhook decoding, no billing request\n";
  (match Paddle_eio.Webhook.decode ~raw_body:body with
   | Ok event -> Printf.printf "Decoded event: %s / %s\n" event.event_id event.event_type
   | Error error -> failwith (Paddle_eio.error_to_string error));
  (match Paddle_eio.Webhook.verify ~now:1_000L ~secret:"demo-only"
    ~signature_header:"not-a-signature" ~raw_body:body () with
   | Error error -> Printf.printf "Invalid signature: %s\n" (Paddle_eio.Webhook.verification_error_to_string error)
   | Ok () -> failwith "invalid signature accepted");
  Printf.printf "Decoding alone is not signature verification. No payment created.\n"
