import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalCommonController, MerchantPortalCommonControllerLoadMatch } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalCommonControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalCommonController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalCommonControllerEntity): MerchantPortalCommonControllerEntity;
    load(this: any, reqmatch?: MerchantPortalCommonControllerLoadMatch, ctrl?: Control): Promise<MerchantPortalCommonControllerEntity>;
}
export { MerchantPortalCommonControllerEntity };
