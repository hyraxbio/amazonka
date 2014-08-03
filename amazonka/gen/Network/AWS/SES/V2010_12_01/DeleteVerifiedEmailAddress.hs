{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.SES.V2010_12_01.DeleteVerifiedEmailAddress
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the specified email address from the list of verified addresses.
-- The DeleteVerifiedEmailAddress action is deprecated as of the May 15, 2012
-- release of Domain Verification. The DeleteIdentity action is now preferred.
-- This action is throttled at one request per second. POST / HTTP/1.1 Date:
-- Thu, 18 Aug 2011 22:20:50 GMT Host: email.us-east-1.amazonaws.com
-- Content-Type: application/x-www-form-urlencoded X-Amzn-Authorization: AWS3
-- AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE,
-- Signature=Rxzyd6cQe/YjkV4yoQAZ243OzzNjFgrsclizTKwRIRc=,
-- Algorithm=HmacSHA256, SignedHeaders=Date;Host Content-Length: 142
-- AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE &Action=DeleteVerifiedEmailAddress
-- &EmailAddress=user%40example.com &Timestamp=2011-08-18T22%3A20%3A50.000Z
-- 5634af08-c865-11e0-8986-3f99a698f914.
module Network.AWS.SES.V2010_12_01.DeleteVerifiedEmailAddress where

import Control.Lens
import Network.AWS.Request.Query
import Network.AWS.SES.V2010_12_01.Types
import Network.AWS.Prelude

data DeleteVerifiedEmailAddress = DeleteVerifiedEmailAddress
    { _dvearEmailAddress :: Text
      -- ^ An email address to be removed from the list of verified
      -- addresses.
    } deriving (Generic)

makeLenses ''DeleteVerifiedEmailAddress

instance ToQuery DeleteVerifiedEmailAddress where
    toQuery = genericToQuery def

data DeleteVerifiedEmailAddressResponse = DeleteVerifiedEmailAddressResponse
    deriving (Eq, Show, Generic)

makeLenses ''DeleteVerifiedEmailAddressResponse

instance AWSRequest DeleteVerifiedEmailAddress where
    type Sv DeleteVerifiedEmailAddress = SES
    type Rs DeleteVerifiedEmailAddress = DeleteVerifiedEmailAddressResponse

    request = post "DeleteVerifiedEmailAddress"
    response _ _ = return (Right DeleteVerifiedEmailAddressResponse)
