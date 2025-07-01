
# 1. Insert Sample Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('a1f1d6b0-0001-4e0a-a111-111111111111', 'Alice', 'Smith', 'alice@example.com', 'hash1', '1234567890', 'host'),
  ('a1f1d6b0-0002-4e0a-a222-222222222222', 'Bob', 'Jones', 'bob@example.com', 'hash2', '0987654321', 'guest'),
  ('a1f1d6b0-0003-4e0a-a333-333333333333', 'Clara', 'Mendez', 'clara@example.com', 'hash3', '5555555555', 'host'),
  ('a1f1d6b0-0004-4e0a-a444-444444444444', 'David', 'Lee', 'david@example.com', 'hash4', '4444444444', 'guest');
# 2. Insert Sample Properties
INSERT INTO Properties (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('b2f2d6b0-0001-4e0a-b111-111111111111', 'a1f1d6b0-0001-4e0a-a111-111111111111', 'Sunny Villa', 'A bright and cozy villa near the beach.', 'Cape Town, South Africa', 150.00),
  ('b2f2d6b0-0002-4e0a-b222-222222222222', 'a1f1d6b0-0003-4e0a-a333-333333333333', 'Mountain Retreat', 'Peaceful cabin with mountain views.', 'Drakensberg, South Africa', 200.00);
# 3. Insert Sample Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('c3f3d6b0-0001-4e0a-c111-111111111111', 'b2f2d6b0-0001-4e0a-b111-111111111111', 'a1f1d6b0-0002-4e0a-a222-222222222222', '2025-08-01', '2025-08-05', 600.00, 'confirmed'),
  ('c3f3d6b0-0002-4e0a-c222-222222222222', 'b2f2d6b0-0002-4e0a-b222-222222222222', 'a1f1d6b0-0004-4e0a-a444-444444444444', '2025-09-10', '2025-09-12', 400.00, 'pending');
# 4. Insert Sample Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('d4f4d6b0-0001-4e0a-d111-111111111111', 'c3f3d6b0-0001-4e0a-c111-111111111111', 600.00, 'credit_card'),
  ('d4f4d6b0-0002-4e0a-d222-222222222222', 'c3f3d6b0-0002-4e0a-c222-222222222222', 400.00, 'paypal');
# 5. Insert Sample Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('e5f5d6b0-0001-4e0a-e111-111111111111', 'b2f2d6b0-0001-4e0a-b111-111111111111', 'a1f1d6b0-0002-4e0a-a222-222222222222', 5, 'Amazing stay! Clean, comfortable, and close to everything.'),
  ('e5f5d6b0-0002-4e0a-e222-222222222222', 'b2f2d6b0-0002-4e0a-b222-222222222222', 'a1f1d6b0-0004-4e0a-a444-444444444444', 4, 'Great location, but water pressure was low.');
# 6. Insert Sample Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('f6f6d6b0-0001-4e0a-f111-111111111111', 'a1f1d6b0-0002-4e0a-a222-222222222222', 'a1f1d6b0-0001-4e0a-a111-111111111111', 'Hi Alice, is the villa available for early check-in?'),
  ('f6f6d6b0-0002-4e0a-f222-222222222222', 'a1f1d6b0-0001-4e0a-a111-111111111111', 'a1f1d6b0-0002-4e0a-a222-222222222222', 'Hi Bob, yes! You can check in from 10 AM.');
