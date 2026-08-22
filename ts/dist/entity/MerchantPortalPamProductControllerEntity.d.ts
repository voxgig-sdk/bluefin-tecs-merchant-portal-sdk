import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalPamProductController, MerchantPortalPamProductControllerCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalPamProductControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalPamProductController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalPamProductControllerEntity): MerchantPortalPamProductControllerEntity;
    create(this: any, reqdata?: MerchantPortalPamProductControllerCreateData, ctrl?: Control): Promise<MerchantPortalPamProductControllerEntity>;
}
export { MerchantPortalPamProductControllerEntity };
