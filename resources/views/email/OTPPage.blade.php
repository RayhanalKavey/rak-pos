<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OTP Verification</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-header bg-primary text-white text-center">
                        <h4>OTP Verification</h4>
                    </div>
                    <div class="card-body text-center">
                        <p class="mb-3">Your One-Time Password (OTP) for verification is:</p>
                        
                        <h2 class="fw-bold text-danger">{{ $otp ?? 'OTP Not Set' }}</h2>
                        <p class="text-muted">This OTP is valid for <strong>{{ $expiration ?? 'Expiration Not Set' }}</strong> minutes.</p>
                        
                        <p>If you did not request this, please ignore this email.</p>
                    </div>
                    <div class="card-footer text-center text-muted">
                        <small>Thank you,<br> <strong>{{ config('app.name') }} Team</strong></small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
