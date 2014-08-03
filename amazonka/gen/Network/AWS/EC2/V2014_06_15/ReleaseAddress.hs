{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.EC2.V2014_06_15.ReleaseAddress
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Releases the specified Elastic IP address. After releasing an Elastic IP
-- address, it is released to the IP address pool and might be unavailable to
-- you. Be sure to update your DNS records and any servers or devices that
-- communicate with the address. If you attempt to release an Elastic IP
-- address that you already released, you'll get an AuthFailure error if the
-- address is already allocated to another AWS account. [EC2-Classic, default
-- VPC] Releasing an Elastic IP address automatically disassociates it from
-- any instance that it's associated with. To disassociate an Elastic IP
-- address without releasing it, use DisassociateAddress. [Nondefault VPC] You
-- must use the DisassociateAddress to disassociate the Elastic IP address
-- before you try to release it. Otherwise, Amazon EC2 returns an error
-- (InvalidIPAddress.InUse). Example for EC2-Classic This example releases the
-- specified Elastic IP address for EC2-Classic.
-- https://ec2.amazonaws.com/?Action=ReleaseAddress &amp;PublicIp=192.0.2.1
-- &amp;AUTHPARAMS Example for EC2-VPC This example releases the specified
-- Elastic IP address for EC2-VPC.
-- https://ec2.amazonaws.com/?Action=ReleaseAddress
-- &amp;AllocationId=eipalloc-5723d13e &amp;AUTHPARAMS.
module Network.AWS.EC2.V2014_06_15.ReleaseAddress where

import Control.Lens
import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'ReleaseAddress' request.
releaseAddress :: ReleaseAddress
releaseAddress = ReleaseAddress
    { _rarDryRun = Nothing
    , _rarAllocationId = Nothing
    , _rarPublicIp = Nothing
    }

data ReleaseAddress = ReleaseAddress
    { _rarDryRun :: Maybe Bool
      -- ^ 
    , _rarAllocationId :: Maybe Text
      -- ^ [EC2-VPC] The allocation ID.
    , _rarPublicIp :: Maybe Text
      -- ^ [EC2-Classic] The Elastic IP address.
    } deriving (Generic)

makeLenses ''ReleaseAddress

instance ToQuery ReleaseAddress where
    toQuery = genericToQuery def

data ReleaseAddressResponse = ReleaseAddressResponse
    deriving (Eq, Show, Generic)

makeLenses ''ReleaseAddressResponse

instance AWSRequest ReleaseAddress where
    type Sv ReleaseAddress = EC2
    type Rs ReleaseAddress = ReleaseAddressResponse

    request = post "ReleaseAddress"
    response _ _ = return (Right ReleaseAddressResponse)
