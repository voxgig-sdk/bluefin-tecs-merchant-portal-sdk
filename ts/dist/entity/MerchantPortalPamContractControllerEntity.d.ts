import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalPamContractController, MerchantPortalPamContractControllerCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalPamContractControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalPamContractController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalPamContractControllerEntity): MerchantPortalPamContractControllerEntity;
    create(this: any, reqdata?: MerchantPortalPamContractControllerCreateData, ctrl?: Control): Promise<MerchantPortalPamContractControllerEntity>;
}
export { MerchantPortalPamContractControllerEntity };
